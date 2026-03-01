import 'package:flutter/material.dart';
import '../routers/router_name.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  void _goToHome(BuildContext context) {
   //push replace can't go back to splash screen{
      Navigator.pushReplacementNamed(context, RouterName.home);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: SingleChildScrollView(
        child: ElevatedButton(
          onPressed: () {
            _goToHome(context);
          },
          child: const Text('Dive In'),
        ),
      )
    );
  }
}