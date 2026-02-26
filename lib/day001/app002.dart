import 'package:flutter/material.dart';

class App002 extends StatelessWidget {
  const App002({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Top row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 148,
                height: 177,
                color: const Color(0xFF55B1AC),
              ),
              Container(
                width: 148,
                height: 177,
                color: const Color(0xFF55B1AC),

              ),
            ],
          ),

          // Middle stacked circles
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 242,
                  height: 242,
                  decoration: const BoxDecoration(
                    color: const Color(0xFF6843FC),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  width: 82,
                  height: 82,
                  decoration: const BoxDecoration(
                    color: const Color(0xFFFF0202),
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),

          // Bottom row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 148 ,
                height: 177,
                color: const Color(0xFF55B1AC),
              ),
              Container(
                width: 148,
                height: 177,
                color: const Color(0xFF55B1AC),
              ),
            ],
          ),
        ],
      ),
    );
  }
}