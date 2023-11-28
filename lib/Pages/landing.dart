import 'package:flutter/material.dart';
import 'package:groceryapp/pages/cart_page.dart';
import 'package:groceryapp/pages/home/home_screen.dart';
import 'package:groceryapp/pages/profile_page.dart';
import 'package:groceryapp/utils/bottomNavBar.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();

  static _LandingState? of(BuildContext context) =>
      context.findAncestorStateOfType<_LandingState>();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  void _navigateBottomNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Method to navigate to the Cart page
  void navigateToCart() {
    setState(() {
      _selectedIndex = 1; // Set the index to the Cart page
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Disable the back button when on the Landing page
        return false;
      },
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [];
          },
          body: _pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomNav,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.pink.shade200,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
