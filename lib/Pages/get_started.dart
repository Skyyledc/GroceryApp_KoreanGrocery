import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Annyeong!'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Get Started!"),
          onPressed: () {
            //Navigate to Login but for now, Navigate to Home
            Navigator.pushReplacementNamed(context, '/landing');
          },
        ),
      ),
    );
  }
}
