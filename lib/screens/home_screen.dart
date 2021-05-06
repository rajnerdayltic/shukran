import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shukran/screens/login_screen.dart';
import 'package:shukran/screens/account_page.dart';
import 'package:shukran/screens/cart/cart_page.dart';
import 'package:shukran/screens/dash_board_page.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_screen';
  static const String uid = "";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email = "";

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  List<Widget> _widgetList = [
    CartPage(),
    DashBoardPage(),
    AccountPage(),
  ];
  int _index = 1;
  void onTappedBar(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false,
        title: Text(
          'Shrukran',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          SizedBox(
            width: 5.0,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
          IconButton(
            onPressed: () {
              _firebaseAuth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 5.0,
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: onTappedBar,
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
        index: _index,
      ),
      body: _widgetList[_index],
    );
  }
}
