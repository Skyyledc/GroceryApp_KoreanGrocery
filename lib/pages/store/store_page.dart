import 'package:flutter/material.dart';
import 'package:groceryapp/pages/store/store_stack.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 3),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                    Column(
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
                                arguments:
                                    1, // 1 corresponds to the 'Cart' page
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Column(
                    children: [
                      const StoreStack(),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 245, 245, 245),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
