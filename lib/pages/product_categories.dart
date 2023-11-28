import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groceryapp/pages/store/store_page.dart';

class CategoryItemsPage extends StatelessWidget {
  final String categoryName;

  const CategoryItemsPage({Key? key, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        title: Text(categoryName),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collectionGroup('products')
            .where('category', isEqualTo: categoryName)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No items available in $categoryName.'),
            );
          } else {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                childAspectRatio: 1,
              ),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return buildProductItem(context, snapshot.data!.docs[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget buildProductItem(BuildContext context, DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    return GestureDetector(
      onTap: () async {
        await onProductItemTapped(context, data);
      },
      child: Stack(
        children: [
          // Display product image here
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.network(
              data['productImg'],
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black.withOpacity(0.7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['productName'], // Product name
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Price: ${data['cost']}', // Product price
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onProductItemTapped(
      BuildContext context, Map<String, dynamic> data) async {
    // Fetch the product ID directly from the product data
    String productId = data['productId'];

    // Query the 'gridCategories' collection for the product with the specified ID
    QuerySnapshot productSnapshot = await FirebaseFirestore.instance
        .collectionGroup('products')
        .where('productId', isEqualTo: productId)
        .limit(1) // Assuming there's only one product with the given ID
        .get();

    if (productSnapshot.docs.isNotEmpty) {
      // Retrieve the product document
      QueryDocumentSnapshot productDoc = productSnapshot.docs[0];

      // Access the 'storeId' from the 'gridCategories' document
      String storeId = productDoc['storeId'];

      // Navigate to the store page using the obtained store ID
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StorePage(storeId: storeId),
        ),
      );
    } else {
      // Handle the case where the product document does not exist
      print('Error: Product document not found.');
    }
  }
}
