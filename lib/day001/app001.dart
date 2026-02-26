import 'package:flutter/material.dart';

class App001 extends StatelessWidget {
  const App001({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Container(
              width: 243,
              height: 243,
              
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
            //spcae
            SizedBox(height: 40),

            Text('Lorem ipsum dolor sit amet consectetur.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            //space
            SizedBox(height: 16),
            Text('Lorem ipsum dolor sit amet consectetur. Consequat facilisis gravida vitae sagittis aenean. Ipsum egestas consequat arcu tellus facilisis consequat sit.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );    
  }
}