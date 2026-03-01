import 'package:flutter/material.dart';
import '../routers/router_name.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    super.key,
    required this.currentIndex,});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF2B2B2B), // active color
      unselectedItemColor: Colors.grey,           // inactive color
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label:"Home"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label:"like"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label:"cart"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label:"notification"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label:"profile"
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, RouterName.home);
            break;
          case 2:
            Navigator.pushNamed(context, RouterName.cart);
            break;
        }
      },
    );
  }
}