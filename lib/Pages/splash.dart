import 'dart:async';

import 'package:flutter/material.dart';
import 'package:groceryapp/pages/get_started.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const GetStarted(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://lottie.host/f23731df-4606-4e22-85e5-e7bbfffab645/KozGbVTItV.json',
          key:
              const Key('lottie_animation'), // Add a key for the Lottie widget.
        ),
      ),
    );
  }
}
