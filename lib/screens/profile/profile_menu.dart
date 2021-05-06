import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu(
      {@required this.menuIcon,
      @required this.menuText,
      @required this.onPressedMenu});

  Icon menuIcon;
  String menuText;
  Function onPressedMenu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: FlatButton(
        padding: EdgeInsets.all(20.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: Color(0xFFE5E8E8),
        onPressed: () {
          onPressedMenu;
        },
        child: Row(
          children: [
            menuIcon,
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Text(
                menuText,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
