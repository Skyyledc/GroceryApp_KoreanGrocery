import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/StoreModel.dart';

class StoreStack extends StatefulWidget {
  final StoreInfo storeInfo;

  const StoreStack({
    Key? key,
    required this.storeInfo,
  }) : super(key: key);

  @override
  State<StoreStack> createState() => _StoreStackState();
}

class _StoreStackState extends State<StoreStack> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 195,
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(widget.storeInfo.imageUrl),
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              height: 120,
              margin: const EdgeInsets.only(
                top: 115,
                left: 40,
                right: 40,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color:
                        const Color.fromARGB(255, 57, 57, 57).withOpacity(0.3),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.storeInfo.storeName,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        Text(
                          widget.storeInfo.storeRating.toStringAsFixed(1),
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          'rating',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.pin_drop,
                          color: Colors.red,
                          size: 20,
                        ),
                        Text(
                          widget.storeInfo.storeDistance.toStringAsFixed(2),
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        Text(
                          'km',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
