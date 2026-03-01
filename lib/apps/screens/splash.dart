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
    //color scheme
    const bg = Color(0xFFD8D7C8); 
    const textDark = Color(0xFF2B2B2B);
    const textSoft = Color(0xFF6B6B6B);
    const buttonFill = Color(0xFFB89362); 
    const buttonText = Color(0xFFF8F6F2);

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 18),
          //coffee image
           Expanded(
            flex:7,
            child: Column(
              children: [
                Image.asset(
                  'assets/photos/coffee_mug.png',
                  fit:BoxFit.contain,
                ),
                const SizedBox(height: 70),
              ],
            ),
          ),
          // Title + description
          Expanded(
                flex: 2,
                child: Column(
                  children: const [
                    SizedBox(height: 8),
                    Text(
                      'Stay Focused',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: textDark,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 14),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Get the cup filled of your choice to stay\n'
                        'focused and awake. Different type of coffee\n'
                        'menu, hot latte cappuccino',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: textSoft,
                          fontSize: 13.5,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          // Home btn
          Padding(
            padding: const EdgeInsets.only(bottom: 26),
            child: SizedBox(
              width: 210,
              height: 52,
              child: ElevatedButton(
                onPressed: () => _goToHome(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonFill,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Dive In',
                      style: TextStyle(
                        color: buttonText,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 12),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: buttonText,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}