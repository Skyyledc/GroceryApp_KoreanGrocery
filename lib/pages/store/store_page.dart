import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/pages/store/store_products.dart';
import 'package:groceryapp/pages/store/store_stack.dart';
import 'package:groceryapp/models/StoreModel.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key, required this.storeId}) : super(key: key);

  final String storeId;

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  StoreInfo storeInfo = StoreInfo(
      storeName: '',
      imageUrl: '',
      storeId: '',
      storeRating: 0.0,
      storeDistance: 0.0);

  Future<void> fetchStoreData() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('gridCategories')
          .where('storeId', isEqualTo: widget.storeId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final DocumentSnapshot storeSnapshot = querySnapshot.docs.first;
        final Map<String, dynamic> data =
            storeSnapshot.data() as Map<String, dynamic>;

        setState(() {
          storeInfo = StoreInfo(
            storeId: widget.storeId,
            storeName: data['name'],
            imageUrl: data['imageUrl'],
            storeRating: (data['storeRating'] as num).toDouble(),
            storeDistance: (data['storeDistance'] as num).toDouble(),
          );
        });
      }
    } catch (e) {
      print("Error fetching store data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStoreData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10, 3, 0, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: Colors.pink.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: IconButton.filled(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 3, 10, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: Colors.pink.shade200,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          child: IconButton.filled(
                            color: Colors.white,
                            onPressed: () async {
                              // Pass the selected index when navigating to the Landing page
                              final updatedValue = await Navigator.pushNamed(
                                context,
                                '/landing',
                                arguments: 1, // Send Screen to Cart
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_cart_checkout,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    StoreStack(
                      storeInfo: storeInfo,
                    ), // Pass storeInfo to StoreStack
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              StoreProducts(storeId: widget.storeId)
            ],
          ),
        ),
      ),
    );
  }
}
