import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shukran/components/rounded_button.dart';
import 'package:shukran/screens/home_screen.dart';
import 'package:shukran/screens/registration_screen.dart';

import '../constants.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                        title: 'LOGIN',
                        color: Colors.blueAccent,
                        onPressed: () async {
                          showSpinner = true;
                          final form = formKey.currentState;
                          if (form.validate()) {
                            try {
                              await _firebaseAuth
                                  .signInWithEmailAndPassword(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim())
                                  .then(
                                    (value) => Fluttertoast.showToast(
                                      msg: 'LogIn  Successfully',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );

                              if (_firebaseAuth != null) {
                                showSpinner = false;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New User?',
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
                                      builder: (context) => RegisterPage()));
                            },
                            child: Text(
                              'Register',
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
}
