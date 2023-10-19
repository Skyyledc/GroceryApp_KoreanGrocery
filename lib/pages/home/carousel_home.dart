import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/models/home_models/Carouselmodel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselWidgetHome extends StatefulWidget {
  const CarouselWidgetHome({super.key});

  @override
  State<CarouselWidgetHome> createState() => _CarouselWidgetHomeState();
}

class _CarouselWidgetHomeState extends State<CarouselWidgetHome> {
  late PageController _pageController;
  final int _currentPage = 0;

  @override
  void initState() {
    super.initState();

    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.8);
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: CarouselSlider.builder(
        itemCount: dataList.length,
        options: CarouselOptions(
          enableInfiniteScroll: true, // Set this to true for looping
          autoPlay: true, // Set this to true if you want it to auto-play
          autoPlayInterval:
              const Duration(seconds: 6), // Set auto-play interval as needed
          viewportFraction: 0.85,
        ),
        itemBuilder: (context, index, realIndex) {
          final dataIndex = realIndex % dataList.length;
          return carouselView(dataIndex);
        },
      ),
    );
  }

  Widget carouselView(int index) {
    return carouselCard(dataList[index]);
  }

  Widget carouselCard(Carousel_Model data) {
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
