import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.pink[200],
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(18)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 85,
                        ),
                        Text(
                          'Grocery Branch',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          'Address of branch',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //Delivery Location
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.pin_drop_outlined,
                  size: 65,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Delivery Location',
                            style: GoogleFonts.poppins(
                                fontSize: 18, fontWeight: FontWeight.w700))
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Delivery Address',
                          style: GoogleFonts.poppins(
                              fontSize: 12, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),

            //Order Summary
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 15, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Summary',
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Add Items',
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue[600]),
                  ),
                ],
              ),
            )

            //Subtotal

            //Payment Details

            //Total
          ],
        ),
      ),
    );
  }
}
