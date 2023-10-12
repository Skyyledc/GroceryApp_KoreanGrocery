import 'package:flutter/material.dart';
import 'package:groceryapp/pages/get_started.dart';
import 'package:groceryapp/pages/home_screen.dart'; // Change 'home.dart' to your actual home screen

import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 5));

    // Check if a user is already signed in with Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      // No user is logged in, navigate to the GetStarted screen
      navigateToGetStarted();
    } else {
      // A user is already signed in, navigate to the Home screen
      navigateToHome();
    }
  }

  void navigateToGetStarted() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GetStarted(),
      ),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/Logo1.png'),
      ),
    );
  }
}
