import 'package:flutter/material.dart';
import 'package:groceryapp/pages/get_started.dart';
import 'package:groceryapp/pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GetStarted(),
      routes: {
        '/homescreen': (context) => const HomeScreen(),
      },
    );
  }
}
