import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115.0,
      width: 115.0,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/profile.png'),
          ),
          Positioned(
            top: 55,
            right: -12,
            bottom: 0,
            child: SizedBox(
              height: 65.0,
              width: 65.0,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                onPressed: () {},
                child: Image.asset('images/photo.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
