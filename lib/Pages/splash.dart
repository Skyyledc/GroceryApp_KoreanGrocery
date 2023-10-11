import 'package:flutter/material.dart';
import 'package:groceryapp/pages/get_started.dart';
import 'package:groceryapp/pages/home_screen.dart'; // Change 'home.dart' to your actual home screen
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Use an async function to await the result of checkFirstTime
    _initialize();
  }

  Future<void> _initialize() async {
    await Future.delayed(const Duration(seconds: 5));
    // Check if it's the first time using the app

    bool isFirstTime = await checkFirstTime();
    if (isFirstTime) {
      // If it's the first time, navigate to the GetStarted screen
      navigateToGetStarted();
    } else {
      // If not the first time, navigate to another screen (e.g., Home)
      navigateToHome();
    }
  }

  Future<bool> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isFirstTime') ?? true;
  }

  void navigateToGetStarted() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const GetStarted(), // No need for 'const' here
      ),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(), // No need for 'const' here
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
