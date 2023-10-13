import 'package:flutter/material.dart';
import 'package:groceryapp/pages/cart_page.dart';
import 'package:groceryapp/pages/home/home_screen.dart';
import 'package:groceryapp/pages/profile_page.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _selectedIndex = 0;

  void _navigateBottomNav(int index) {
    setState(() {
      _selectedIndex = index;
      _scrollToTop(); // Call _scrollToTop when changing tabs
    });
  }

  void _scrollToTop() {
    // Implement scrolling logic here.
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const CartPage(),
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
