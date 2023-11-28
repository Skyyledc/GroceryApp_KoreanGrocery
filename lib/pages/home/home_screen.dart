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

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    // Set up fade-in animation
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeInOut,
      ),
    );

    // Set up slide-up animation
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.easeInOut,
      ),
    );

    // Trigger the animations when the widget is first built
    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10, 15, 10, 0),
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
                      Navigator.pushNamed(context, '/purchase_history');
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
    );
  }

  Widget _buildMainPageContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 245, 245, 245),
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            // Fade-in animation for CategoriesHome
            FadeTransition(
              opacity: _fadeAnimation,
              child: const CategoeriesHome(),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: Text(
                      'Promo',
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Fade-in animation for CarouselWidgetHome
            FadeTransition(
              opacity: _fadeAnimation,
              child: const CarouselWidgetHome(),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Fade-in and Slide-up animation for PopularItemsHome
                  SlideTransition(
                    position: _slideAnimation,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        'Popular Items',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Fade-in and Slide-up animation for PopularItemsHome
            SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: const PopularItemsHome(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchContainer() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.only(
          top: 65,
          left: 25,
          right: 25,
        ),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: const SearchContainerHome(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 155, 188),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Main Page Container
              Column(
                children: [
                  // Top Bar
                  _buildTopBar(),

                  const SizedBox(height: 35),
                  // Main Page Container

                  _buildMainPageContainer(),
                ],
              ),

              // Search Container
              _buildSearchContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
