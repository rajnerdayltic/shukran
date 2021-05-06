import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shukran/components/rounded_button.dart';
import 'package:shukran/constants.dart';
import 'package:shukran/screens/login_screen.dart';

import 'home_screen.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({this.app});
  static const String id = 'register_screen';
  final FirebaseApp app;

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final referenceDatabase = FirebaseDatabase.instance;
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  // bool _success;
  // String _userEmail = '';
  bool showSpinner = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ref = referenceDatabase.reference();
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Hero(
                        tag: 'logo',
                        child: Container(
                          height: 100.0,
                          child: Image.asset('images/logo.png'),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      TextFormField(
                        controller: _nameController,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Your Name here.',
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Your Email here.',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blueAccent,
                          ),
                        ),
                        autofillHints: [AutofillHints.email],
                        validator: (_emailController) =>
                            _emailController != null &&
                                    !EmailValidator.validate(_emailController)
                                ? 'Enter a Valid Email'
                                : null,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black),
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Your Password here.',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      RoundedButton(
                        title: 'REGISTER',
                        color: Colors.blueAccent,
                        onPressed: () async {
                          showSpinner = true;
                          if (formKey.currentState.validate()) {
                            await _firebaseAuth
                                .createUserWithEmailAndPassword(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text.trim())
                                .then((users) => collectionReference.add({
                                      'name': _nameController.text,
                                      'email': _emailController.text,
                                      'password': _passwordController.text,
                                    }))
                                .then((value) => Fluttertoast.showToast(
                                      msg: 'Registered Successfully',
                                      toastLength: Toast.LENGTH_SHORT,
                                    ));

                            showSpinner = false;
                            if (_firebaseAuth != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            }
                          }
                          // return users.add({
                          //   "email": _emailController.text,
                          //   "name": _nameController.text
                          // }).then((value) => print('users added'));
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already an User?',
                            style:
                                TextStyle(color: Colors.black, fontSize: 15.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // bool loading = false;
  // var error = "";
  //
  // void register() {
  //   if (formKey.currentState.validate()) {
  //     FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: _emailController.text.trim(),
  //             password: _passwordController.text)
  //         .then((currentUser) => FirebaseFirestore.instance
  //             .collection("Users")
  //             .doc(currentUser.user.uid)
  //             .set({
  //               "uid": currentUser.user.uid,
  //               "name": _nameController.text,
  //               "email": _emailController.text,
  //               "password": _passwordController.text,
  //             })
  //             .then((result) => {
  //                   Navigator.pushAndRemoveUntil(
  //                       context,
  //                       MaterialPageRoute(builder: (context) => HomePage()),
  //                       (_) => false),
  //                   _nameController.clear(),
  //                   _emailController.clear(),
  //                   _passwordController.clear(),
  //                 })
  //             .catchError((e) => print(e)))
  //         .catchError((e) => print(e));
  //     print('registered');
  //   } else {
  //     setState(() {
  //       error = 'Please check the details entered';
  //       loading = false;
  //     });
  //   }
  // }
}

//.then(
//   (value) => ref
//       .child('Users')
//       .push()
//       .set(_emailController.text)
//       .asStream(),
// ),

//     .then((user) =>
// .then((value) => print('user added')),
//
//
// Fluttertoast.showToast(
// msg: 'Registered Successfully',
// toastLength: Toast.LENGTH_SHORT,
// )
