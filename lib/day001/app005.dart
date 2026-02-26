import 'package:flutter/material.dart';

class App005 extends StatelessWidget {
  const App005({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("Lorem ipsum dolor sit amet consectetur.",
                style: TextStyle(
                  fontFamily: "IngridDarling",
                  fontSize: 24,
                ),
              ),
              Image.asset(
                'assets/photos/hamster.png',
                width: 200,
             )
            ],
          ),  
        ),
      ),
    ),
  );   

  }
}