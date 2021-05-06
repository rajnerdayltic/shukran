import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shukran/screens/profile/profile_image.dart';
import 'package:shukran/screens/profile/profile_menu.dart';

import 'login_screen.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 10.0),
              ProfileImage(),
              SizedBox(
                height: 20.0,
              ),
              ProfileMenu(
                menuText: 'Your Favorites',
                menuIcon: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                  size: 20.0,
                ),
                onPressedMenu: () {},
              ),
              SizedBox(
                height: 20.0,
              ),
              ProfileMenu(
                menuText: 'My Orders',
                menuIcon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                  size: 20.0,
                ),
                onPressedMenu: () {},
              ),
              SizedBox(
                height: 20.0,
              ),
              ProfileMenu(
                menuText: 'Logout',
                menuIcon: Icon(
                  Icons.logout,
                  color: Colors.black,
                  size: 20.0,
                ),
                onPressedMenu: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
