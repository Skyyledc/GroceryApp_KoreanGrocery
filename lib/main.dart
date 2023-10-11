import 'package:flutter/material.dart';
import 'package:groceryapp/Pages/login_page.dart';
import 'package:groceryapp/Pages/signup_page.dart';
import 'package:groceryapp/pages/cart_page.dart';
import 'package:groceryapp/pages/get_started.dart';
import 'package:groceryapp/pages/home_screen.dart';
import 'package:groceryapp/pages/landing.dart';
import 'package:groceryapp/pages/profile_page.dart';
import 'package:groceryapp/pages/search_page.dart';
import 'package:groceryapp/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/getstarted': (context) => const GetStarted(),
        '/landing': (context) => const Landing(),
        '/homescreen': (context) => const HomeScreen(),
        '/cartscreen': (context) => const CartPage(),
        '/searchscreen': (context) => const Searchpage(),
        '/profilescreen': (context) => const ProfilePage(),
        '/loginscreen': (context) => const LoginScreen(),
        '/signupscreen': (context) => const SignupScreen(),
      },
    );
  }
}
