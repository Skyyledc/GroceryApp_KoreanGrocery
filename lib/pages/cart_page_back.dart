import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';
import 'package:groceryapp/models/CartItemsProvider.dart';
import 'package:groceryapp/models/CartItemModel.dart';

class CartPageBack extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CartPageBack({Key? key}) : super(key: key);

  // Function to calculate the subtotal
  double calculateSubtotal(List<CartItem> cartItems) {
    double subtotal = 0.0;
    for (var item in cartItems) {
      subtotal += item.price * item.quantity;
    }
    return subtotal;
  }

  double calculateDeliveryFee(List<CartItem> cartItems) {
    double deliveryFee = cartItems.isEmpty ? 0.0 : 50.0;
    return deliveryFee;
  }

  // Function to calculate the total
  double calculateTotal(List<CartItem> cartItems) {
    double finalsubtotal = calculateSubtotal(cartItems);
    double finaldeliveryfee = calculateDeliveryFee(cartItems);
    return finalsubtotal + finaldeliveryfee;
  }

  @override
  Widget build(BuildContext context) {
    final cartItemsProvider = Provider.of<CartItemsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.pink[200],
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(18),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Row(children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      //const SizedBox(width: 85),
                      Text(
                        'Checkout',
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ]),
                    Row(
                      children: [
                        Text(
                          '-- Address --',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),

            // Delivery Location
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.pin_drop_outlined,
                  size: 65,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Delivery Location',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery Address',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  Consumer<CartItemsProvider>(
                    builder: (context, cartItemsProvider, child) {
                      if (cartItemsProvider.cartItems.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('No items in cart.'),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartItemsProvider.cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItemsProvider.cartItems[index];
                          return ListTile(
                            title: Text(item.productName),
                            subtitle: Text('Quantity: ${item.quantity}'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('PHP ${item.price * item.quantity}'),
                                IconButton.filled(
                                  color: Colors.red.shade300,
                                  icon:
                                      const Icon(Icons.indeterminate_check_box),
                                  onPressed: () {
                                    cartItemsProvider.reduceQuantity(
                                        context, index);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'PHP ${calculateSubtotal(cartItemsProvider.cartItems)}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Payment Details:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text('Cash on Delivery'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Delivery Fee:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'PHP ${calculateDeliveryFee(cartItemsProvider.cartItems)}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'PHP ${calculateTotal(cartItemsProvider.cartItems)}',
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.pink[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  finalizeOrder(context, cartItemsProvider, _auth);
                },
                child: const Text('Finalize Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void finalizeOrder(
    BuildContext context,
    CartItemsProvider cartItemsProvider,
    FirebaseAuth auth,
  ) async {
    User? user = auth.currentUser;

    if (user == null) {
      // User is not logged in, show alert
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please log in before finalizing the order.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // User is logged in, proceed with order finalization
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Order Finalized'),
            content: const Text('Your order has been sent!'),
            actions: [
              TextButton(
                onPressed: () async {
                  // Save order history to Firestore
                  await FirebaseFirestore.instance
                      .collection('purchase_history')
                      .doc(user.uid)
                      .collection('orders')
                      .add({
                    'timestamp': FieldValue.serverTimestamp(),
                    'total': calculateTotal(cartItemsProvider.cartItems),
                    // Add other relevant information about the order
                  });

                  // Clear the cart after finalizing the order
                  cartItemsProvider.clearCart();
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
