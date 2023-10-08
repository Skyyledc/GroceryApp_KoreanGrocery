import 'package:flutter/material.dart';
import 'package:groceryapp/pages/cart_page.dart';
import 'package:groceryapp/pages/home_screen.dart';
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
    // Implement  scrolling logic here.
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            // const SliverAppBar(
            //   expandedHeight: 70.0,
            //   floating: true,
            //   pinned: false,
            //   backgroundColor: Colors.transparent,
            //   flexibleSpace: FlexibleSpaceBar(
            //     title: Text(
            //       'Annyeong!',
            //       style: TextStyle(
            //         color: Colors.black,
            //         fontSize: 20,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ),
            // ),
          ];
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
    );
  }
}
