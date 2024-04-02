import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/custom%20classes/text_field.dart';
import 'package:flutter_application/screens/home/home_screen.dart';
import 'package:gap/gap.dart';
import 'package:flutter_application/register/sign_up_page.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailOrUsernameController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  final int _success = 1;
  // ignore: unused_field
  final String _userEmail = " ";

  // ----------------- REGULAR EXPRESSION FOR EMAIL
  RegExp regex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$');
  bool _isSignedIn = false; // Flag to track if user is signed in
// sing user in

  Future<void> _signin() async {
    String email = _emailOrUsernameController.text.trim();
    String password = _passwordController.text.trim();
    try {
      //check if the input is email
      // bool isEmail = email.contains("@");
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      //if signin successful, then navigate to homepage

      setState(() {
        _isSignedIn = true; // Update sign-in status
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const HomePage()));
    // }
    on FirebaseAuthException catch (e) {
      displayMessage(e.message ?? "An error occured");
    }
  }

  //display a dialog message
  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                textAlign: TextAlign.center,
                message.toString(),
                style: const TextStyle(
                    color: Color(0xffFE9801),
                    fontSize: 16,
                    fontFamily: "Rowdies"),
              ),
            ));
  }

  // function to fill the textfields
  bool _fillFields() {
    return regex.hasMatch(_emailOrUsernameController.text) &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    // FOR REUSING PUROSE
    // I used it in dialog pop up message
    bool isEmail = regex.hasMatch(_emailOrUsernameController.text);

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Gap(97),
                const Text(
                  "Login here",
                  style: TextStyle(
                    color: Color(0xff697c37),
                    fontFamily: 'Rowdies',
                    fontSize: 32,
                  ),
                ),
                const Gap(30),
                const Text(
                  "Welcome back you’ve\n        been missed!",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Rowdies',
                      color: Color(0xFFB0AA86)),
                ),
                const Gap(50),
                CustomTextField(
                  label: 'Email',
                  controller: _emailOrUsernameController,
                  hideText: false,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.09,
                ),
                CustomTextField(
                  label: 'Password',
                  controller: _passwordController,
                  hideText: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFE9801),
                      minimumSize: const Size(357, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    if (_fillFields()) {
                      try {
                        _signin();
                      } catch (e) {
                        print("Sign-in error: $e");
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: const Color(0xffFCFCF8),
                          title: Text(
                            textAlign: TextAlign.center,
                            isEmail
                                ? "Please fill all the fields"
                                : "Email not in a correct format",
                            style: const TextStyle(
                                color: Color(0xffFE9801),
                                fontSize: 16,
                                fontFamily: "Rowdies"),
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        fontFamily: 'Rowdies',
                        color: Color(0xFFFFFFFF),
                        fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.08,
                ),
                GestureDetector(
                  child: const Text(
                    "Create new account",
                    style: TextStyle(
                        color: Color(0xFFFE9801),
                        fontSize: 14,
                        fontFamily: 'Rowdies'),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignIn(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
