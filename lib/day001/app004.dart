import 'package:flutter/material.dart';

class App004 extends StatelessWidget {
  const App004({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // black bog box
                Container(
                  width: 326,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF142022),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 18,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Pair of Linear Equation in Two\nVariables',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          height: 1.25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Maths / Real Numbers',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 18),

                      // green box
                      Container(
                        width: 220,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF27AE60),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '4',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Correct Answers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 14),

                      // red box
                      Container(
                        width: 220,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEB5757),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '5',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'Wrong Answers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              OptionItem(
                optionLabel: 'A',
                optionText: 'Intersect at one point',
              ),
              const SizedBox(height: 16),
              OptionItem(
                optionLabel: 'B',
                optionText: 'Intersect at two point',
              ),
              const SizedBox(height: 16),
              OptionItem(
                optionLabel: 'C',
                optionText: 'Parallel',
              ),
              const SizedBox(height: 16),
              OptionItem(
                optionLabel: 'D',
                optionText: 'Coincident',
              ),
              const SizedBox(height: 16),
              ],
              
            ),
          ),
        ),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final String optionLabel;
  final String optionText;

  const OptionItem({
    super.key,
    required this.optionLabel,
    required this.optionText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
      color: const Color(0xFF263133),
      borderRadius: BorderRadius.circular(28),
    ),
    child: Row(
      children: [
        Text(
          '$optionLabel.',
          style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
          ),
      ),
       SizedBox(width: 14),
      Expanded(
       child: Text(
          optionText,
          style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
                ],
              ),
            );
  }
}
