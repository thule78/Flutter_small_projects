import 'package:flutter/material.dart';

//for screens
import '../screens/cart.dart';
import '../screens/category.dart';
import '../screens/detail.dart';
import '../screens/home.dart';
import '../screens/splash.dart';
//for router name
import 'router_name.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //start screen
      initialRoute: RouterName.splash,
      //routes
      routes: {
        RouterName.splash: (context) => const SplashScreen(),
        RouterName.home: (context) => const HomeScreen(),
        RouterName.category: (context) => const CategoryScreen(),
        RouterName.detail: (context) => const DetailScreen(),
        RouterName.cart: (context) => const CartScreen(),
      },
    );
  }
}
