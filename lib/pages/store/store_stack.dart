import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoreStack extends StatefulWidget {
  final String storeId; // Add a storeId parameter

  const StoreStack({Key? key, required this.storeId}) : super(key: key);

  @override
  State<StoreStack> createState() => _StoreStackState();
}

class _StoreStackState extends State<StoreStack> {
  Future<String> fetchStoreName() async {
    // Replace this with your Firestore query to fetch the store name
    // You should use the widget.storeId to fetch the store name associated with this storeId.
    // Example:
    // final storeName = await FirestoreService.fetchStoreName(widget.storeId);
    const storeName = 'Your Store Name from Firestore';
    return storeName;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchStoreName(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Show a loading indicator while fetching data.
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final storeName = snapshot.data;

          return Stack(children: [
            Container(
              height: 190,
              margin: const EdgeInsets.only(left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1590301157890-4810ed352733?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1936&q=80",
                  ),
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
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
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
                              storeName ?? '', // Display the fetched store name
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
                            Icon(
                              Icons.star,
                              color: Colors.yellow[700],
                              size: 15,
                            ),
                            Text(
                              '4.5',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_pin,
                              color: Colors.red[700],
                              size: 15,
                            ),
                            Text(
                              '2.5 km',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '(25 mins)',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ]);
        }
      },
    );
  }
}
