import 'package:flutter/material.dart';
import 'package:groceryapp/pages/get_started.dart';
import 'package:groceryapp/pages/home_screen.dart'; // Change 'home.dart' to your actual home screen
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirstTime = true;

  @override
  void initState() {
    super.initState();
    // Use an async function to await the result of checkFirstTime
    _initialize();
  }

  Future<void> _initialize() async {
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
        builder: (context) => const GetStarted(),
      ),
    );
  }

  void navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const HomeScreen(), // Change to your actual home screen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://lottie.host/f23731df-4606-4e22-85e5-e7bbfffab645/KozGbVTItV.json',
          key: const Key('lottie_animation'),
        ),
      ),
    );
  }
}
