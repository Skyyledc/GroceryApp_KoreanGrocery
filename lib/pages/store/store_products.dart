import 'dart:convert';

import 'package:provider/provider.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/CartItemModel.dart';
import 'package:groceryapp/models/CartItemsProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoreProducts extends StatefulWidget {
  final String storeId;

  const StoreProducts({Key? key, required this.storeId}) : super(key: key);

  @override
  State<StoreProducts> createState() => _StoreProductsState();
}

class _StoreProductsState extends State<StoreProducts> {
  late Future<List<Map<String, dynamic>>> products;
  List<CartItem> cartItems = [];

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
                                        ? IconButton.filled(
                                            color: Colors.pink.shade200,
                                            icon: const Icon(
                                                Icons.add_shopping_cart),
                                            onPressed: () {
                                              addToCart(product);
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

  void addToCart(Map<String, dynamic> product) async {
    int? quantity = await _showQuantityDialog();
    if (quantity != null && quantity > 0) {
      final cartProvider =
          Provider.of<CartItemsProvider>(context, listen: false);

      cartProvider.addToCart(
        CartItem(
          productId: product['productId'],
          productName: product['productName'],
          price: double.parse(product['cost'].toString()),
          quantity: quantity,
        ),
      );
      saveCart();
    }
  }

  Future<int?> _showQuantityDialog() async {
    int quantity = 1; // Default quantity

    return showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Select Quantity'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Choose the quantity for this item:'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                      Text(quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, null); // Return null for cancel
                  },
                  child: Text('Cancel',
                      style: GoogleFonts.poppins(
                        color: Colors.pink.shade300,
                      )),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, quantity);
                  },
                  child: Text(
                    'Add to Cart',
                    style: GoogleFonts.poppins(
                      color: Colors.pink.shade300,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson =
        jsonEncode(cartItems.map((item) => item.toJson()).toList());
    await prefs.setString('cartItems', cartJson);
  }

  Future<void> loadCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString('cartItems');
    if (cartJson != null) {
      final List<dynamic> cartList = jsonDecode(cartJson);
      setState(() {
        cartItems = cartList.map((item) => CartItem.fromJson(item)).toList();
      });
    }
  }
}
