import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/pages/home/carousel_home.dart';
import 'package:groceryapp/pages/home/home_categories.dart';
import 'package:groceryapp/pages/home/popular_items.dart';
import 'package:groceryapp/pages/home/search_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 155, 188),
      //Body Container
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                //Main App Content
                children: [
                  //Top Bar Container
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'DELIVER TO',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Home',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Column(
                            children: [
                              Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.white24,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton.filled(
                                  color: Colors.white,
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/cartscreen');
                                  },
                                  icon: const Icon(
                                    Icons.receipt_long_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Top Bar Container End

                  //
                  const SizedBox(
                    height: 30,
                  ),
                  //

                  //Main Page Container
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 245, 245, 245),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(18)),
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          //

                          const SizedBox(
                            height: 35,
                          ),

                          // Container for Categories
                          const CategoeriesHome(),
                          // Container for Categories End

                          //Promo Text Container
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 5, 0, 0),
                                child: Text(
                                  'Promo',
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          //Promo Text Container End

                          //Promo Main Container -> Carousel
                          const CarouselWidgetHome(),
                          //Promo Main Container -> Carousel End

                          //Popular Items Text Container
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 0, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Popular Items',
                                  style: GoogleFonts.poppins(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          //Popular Items Text Container End

                          //Popular Items Main Grid
                          const PopularItemsHome()
                          //Populer Items Main Grid End
                        ],
                      ),
                    ),
                  ),
                ],
                //ListView Contents End
              ),

              //
              Align(
                alignment: Alignment.topCenter,

                //
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 65,
                    left: 25,
                    right: 25,
                  ),

                  child: //Search Container -> Button Redirect
                      const SearchContainerHome(),
                  //Search Container -> Button Redirect End,
                ),
              ),
              //Search Container -> Button Redirect End
            ],
          ),
          //Search Container -> Button Redirect
        ),
      ),
    );
  }
}
