import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreProducts extends StatefulWidget {
  final String storeId;

  const StoreProducts({Key? key, required this.storeId}) : super(key: key);

  @override
  State<StoreProducts> createState() => _StoreProductsState();
}

class _StoreProductsState extends State<StoreProducts> {
  late Future<List<Map<String, dynamic>>> products;

  @override
  void initState() {
    super.initState();
    products = fetchProducts();
  }

  Future<List<Map<String, dynamic>>> fetchProducts() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('gridCategories')
          .doc(widget.storeId)
          .collection('products')
          .orderBy('productName') // Order by productName
          .get();

      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (e) {
      print("Error fetching products: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: products,
      builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display a loading indicator while waiting for data
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Display an error message if an error occurs
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Display a message when there are no products
          return Center(
            child: Text(
              'No products available. :(',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        } else {
          // Group products by category
          Map<String, List<Map<String, dynamic>>> groupedProducts = {};
          for (var product in snapshot.data!) {
            String category = product['category'] ?? 'Other';
            if (!groupedProducts.containsKey(category)) {
              groupedProducts[category] = [];
            }
            groupedProducts[category]!.add(product);
          }

          return SizedBox(
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: groupedProducts.entries.map((entry) {
                  String category = entry.key;
                  List<Map<String, dynamic>> categoryProducts = entry.value;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          category,
                          style: GoogleFonts.lato(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categoryProducts.length,
                          itemBuilder: (context, index) {
                            final product = categoryProducts[index];
                            final bool isAvailable =
                                product['productAvailable'] ?? true;

                            // Use the product data to build your UI
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Image.network(
                                      product['productImg'],
                                      fit: BoxFit.fill,
                                      color: isAvailable ? null : Colors.grey,
                                      colorBlendMode:
                                          isAvailable ? null : BlendMode.color,
                                    ),
                                    title: Text(
                                      product['productName'],
                                      style: GoogleFonts.lato(
                                        color: isAvailable
                                            ? Colors.black
                                            : Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${product['cost']}.00',
                                          style: GoogleFonts.lato(
                                            color: isAvailable
                                                ? Colors.black
                                                : Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        if (!isAvailable)
                                          Text(
                                            'Unavailable',
                                            style: GoogleFonts.lato(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          ),
                                      ],
                                    ),
                                    trailing: isAvailable
                                        ? IconButton(
                                            icon: const Icon(
                                                Icons.add_shopping_cart),
                                            onPressed: () {
                                              // Add to cart logic here
                                            },
                                          )
                                        : null,
                                  ),
                                ),
                                if (index != categoryProducts.length - 1 ||
                                    entry != groupedProducts.entries.last)
                                  const Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          );
        }
      },
    );
  }
}
