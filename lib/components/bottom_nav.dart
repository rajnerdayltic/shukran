import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 50.0,
      color: Colors.blueAccent,
      backgroundColor: Colors.white,
      buttonBackgroundColor: Colors.blueAccent,
      items: <Widget>[
        Icon(Icons.shopping_cart, size: 20.0, color: Colors.white),
        Icon(Icons.home, size: 20.0, color: Colors.white),
        Icon(Icons.account_circle, size: 20.0, color: Colors.white),
      ],
      animationDuration: Duration(milliseconds: 200),
      animationCurve: Curves.easeIn,
    );
  }
}
