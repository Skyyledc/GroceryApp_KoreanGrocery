import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoeriesHome extends StatefulWidget {
  const CategoeriesHome({super.key});

  @override
  State<CategoeriesHome> createState() => _CategoeriesHomeState();
}

class _CategoeriesHomeState extends State<CategoeriesHome> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //First Child Container Fresh Meat
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxtZWF0fGVufDB8fHx8MTY5NjM5MjA5MXww&ixlib=rb-4.0.3&q=80&w=1080',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Fresh Meat',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ), // Style
                    ),
                  ],
                ),
              ),
              //First Child Container Fresh Meat End

              //Second Child Container Sauces
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1472476443507-c7a5948772fc?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyfHxzYXVjZXxlbnwwfHx8fDE2OTYzOTIwNzZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Sauces',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ), // Style
                    ),
                  ],
                ),
              ),
              //Second Child Container Sauces End

              //Second Child Container Sauces
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxyYW1lbnxlbnwwfHx8fDE2OTYzOTIwMjl8MA&ixlib=rb-4.0.3&q=80&w=1080',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Ramen',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ), // Style
                    ),
                  ],
                ),
              ),
              //Second Child Container Sauces End

              //Second Child Container Sauces
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 75,
                      height: 75,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        width: 120,
                        height: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1562749606-0a9eb5a8a0f3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxzYW1neWV0YW5nfGVufDB8fHx8MTY5NjQyNDA4MXww&ixlib=rb-4.0.3&q=80&w=1080',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      'Beverages',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ), // Style
                    ),
                  ],
                ),
              ),
              //Fourth Child Container Sauces End
            ],
            //Top Container for Choices End
          ),
        ),
      ),
    );
  }
}
