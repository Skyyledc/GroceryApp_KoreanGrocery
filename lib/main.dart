import 'package:flutter/material.dart';
import 'package:groceryapp/pages/purchase_history_page.dart';
import 'package:groceryapp/pages/cart_page_back.dart';
import 'package:provider/provider.dart';
import 'package:groceryapp/pages/splash.dart';
import 'package:groceryapp/pages/get_started.dart';
import 'package:groceryapp/pages/landing.dart';
import 'package:groceryapp/pages/home/home_screen.dart';
import 'package:groceryapp/pages/cart_page.dart';
import 'package:groceryapp/pages/search_page.dart';
import 'package:groceryapp/pages/profile_page.dart';
import 'package:groceryapp/Pages/login_page.dart';
import 'package:groceryapp/Pages/signup_page.dart';
import 'package:groceryapp/models/StoreModel.dart';
import 'package:groceryapp/pages/store/store_page.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:groceryapp/models/CartItemsProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartItemsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/getstarted': (context) => const GetStarted(),
        '/landing': (context) => const Landing(),
        '/homescreen': (context) => const HomeScreen(),
        '/cartscreen': (context) => CartPage(),
        '/cartscreenback': (context) => CartPageBack(),
        '/searchscreen': (context) => const Searchpage(),
        '/profilescreen': (context) => const ProfilePage(),
        '/loginscreen': (context) => const LoginScreen(),
        '/signupscreen': (context) => const SignupScreen(),
        '/storepage': (context) {
          final StoreInfo storeInfo =
              ModalRoute.of(context)!.settings.arguments as StoreInfo;
          return StorePage(
            storeId: storeInfo.storeId,
          );
        },
        '/purchase_history': (context) => PurchaseHistoryPage(),
      },
    );
  }
}
