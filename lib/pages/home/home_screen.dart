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
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              //Main App Content
              children: [
                //Search Container -> Button Redirect
                const SearchContainerHome(),
                //Search Container -> Button Redirect End

                // Container for Categories
                const CategoeriesHome(),
                //Top Container for Choices End

                //Sizedbox to create a space
                const SizedBox(
                  height: 15,
                ),
                //Sizedbox to create a space end

                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(18)),
                  ),
                  child: Center(
                    child: Column(
                      children: [
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
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Popular Items',
                                style: GoogleFonts.poppins(
                                    fontSize: 20, fontWeight: FontWeight.w600),
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
          ),
        ),
      ),
    );
  }
}
