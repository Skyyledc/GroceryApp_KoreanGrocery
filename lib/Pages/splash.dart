import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    await Future.delayed(const Duration(seconds: 1));
// Check for internet connectivity
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      // No internet connection, show a custom pop-up
      showNoInternetPopup();
    } else {
      // Check if a user is already signed in with Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        await Future.delayed(const Duration(seconds: 2));
        // No user is logged in, navigate to the GetStarted screen
        navigateToGetStarted();
      } else {
        await Future.delayed(const Duration(seconds: 2));
        // A user is already signed in, navigate to the Home screen
        navigateToMain();
      }
    }
  }

  void showNoInternetPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("No Internet Connection"),
          content: const Text("You need an internet connection to proceed."),
          actions: <Widget>[
            TextButton(
              child: const Text("Try Again"),
              onPressed: () {
                Navigator.of(context).pop();
                _initialize(); // Retry internet connectivity check
              },
            ),
            TextButton(
              child: const Text("Close App"),
              onPressed: () {
                Navigator.of(context).pop();
                // Close the application
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.black, width: 1),
          ),
        );
      },
    );
  }

  void navigateToGetStarted() {
    Navigator.pushReplacementNamed(context, '/onboardingscreen');
  }

  void navigateToMain() {
    Navigator.pushReplacementNamed(context, '/landing');
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
