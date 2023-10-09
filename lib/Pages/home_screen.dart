import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/Carouselmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
//Carousel Controller

  late PageController _pageController;
  final int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 155, 188),
      //Body Container
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
//Main App Content
            children: [
              //Top Container for Choices
              Padding(
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
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
              //Top Container for Choices End

              //Search Container -> Button Redirect
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/searchscreen');
                },
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 325,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        15, 0, 0, 0),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.black,
                                      size: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                    child: AnimatedTextKit(
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          "What are you craving?",
                                          textStyle: GoogleFonts.poppins(
                                              color: Colors.grey[400],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TyperAnimatedText(
                                          "Oh I think I want some Ramen!",
                                          textStyle: GoogleFonts.poppins(
                                              color: Colors.grey[400],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TyperAnimatedText(
                                          "I could really eat some Sampgyupsal!",
                                          textStyle: GoogleFonts.poppins(
                                              color: Colors.grey[400],
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                      repeatForever: true,
                                      pause: const Duration(milliseconds: 3000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //Search Container -> Button Redirect End

//Sizedbox to create a space
              const SizedBox(
                height: 15,
              ),
//Sizedbox to create a space end

              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
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
                      SizedBox(
                        height: 250, // Adjust the height as needed
                        child: CarouselSlider.builder(
                          itemCount: dataList.length,
                          options: CarouselOptions(
                            enableInfiniteScroll:
                                true, // Set this to true for looping
                            autoPlay:
                                true, // Set this to true if you want it to auto-play
                            autoPlayInterval: const Duration(
                                seconds: 6), // Set auto-play interval as needed
                            viewportFraction: 0.8,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            final dataIndex = realIndex % dataList.length;
                            return carouselView(dataIndex);
                          },
                        ),
                      ),

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
                      SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: GridView(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            childAspectRatio: 1,
                          ),
                          shrinkWrap: true,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1575932444877-5106bee2a599?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxrb3JlYW4lMjBjaGlja2VufGVufDB8fHx8MTY5NjQyMzk4N3ww&ixlib=rb-4.0.3&q=80&w=1080',
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1639321905636-c1c0e71fb467?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHw0fHxiaWJpbWJhcHxlbnwwfHx8fDE2OTY0MjQwMTZ8MA&ixlib=rb-4.0.3&q=80&w=1080',
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1679581083578-94eae6e8d7a4?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHx0dGVva2Jva2tpfGVufDB8fHx8MTY5NjQyNDA0NXww&ixlib=rb-4.0.3&q=80&w=1080',
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1562749606-0a9eb5a8a0f3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxfHxzYW1neWV0YW5nfGVufDB8fHx8MTY5NjQyNDA4MXww&ixlib=rb-4.0.3&q=80&w=1080',
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),

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
    );
  }

  Widget carouselView(int index) {
    return carouselCard(dataList[index]);
  }

  Widget carouselCard(CarouselModel data) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Text(
                'Order Now',
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: Icon(
                Icons.arrow_circle_right,
                color: Colors.black,
                size: 18,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(data.imageName),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                " ${data.promoMsg}",
                style: GoogleFonts.poppins(
                    fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
