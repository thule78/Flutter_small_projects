import 'package:flutter/material.dart';

class App003 extends StatelessWidget {
  const App003({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // top bar
              Container(
                width: 355,
                height: 47,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color(0xFFF6E299),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: const Text(
                  'Lorem ipsum dolor sit amet consectetur.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // space
              const SizedBox(height: 70),

              // big card with red dot and ribbon
              Stack(
                children: [
                  Container(
                    width: 303,
                    height: 303,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFCBCBCB),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF55B1AC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  // Red dot (top-left)
                  Positioned(
                    top: 23,
                    left: 23,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                  // ribbon (top-right)
                  Positioned(
                    top: 10,
                    right: -60,
                    child: Transform.rotate(
                      angle: 0.8,
                      child: Container(
                        width: 160,
                        height: 32,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              // space
              const SizedBox(height: 40),

              // bottom text
              const Text(
                "Lorem ipsum dolor sit amet consectetur. Consequat facilisis gravida vitae sagittis aenean. Ipsum egestas consequat arcu tellus facilisis consequat sit.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}