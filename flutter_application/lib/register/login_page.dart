import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/custom%20classes/text_field.dart';
import 'package:flutter_application/home/home_screen.dart';
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
// sing user in
  void _signin() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailOrUsernameController.text,
          password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      displayMessage(e.code);
    }
  }

  //display a dialog message
  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  // function to fill the textfields
  bool _fillFields() {
    return _emailOrUsernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
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
                  label: 'Username / Email',
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      } catch (e) {
                        print("Sign-in error: $e");
                      }
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                backgroundColor: Color(0xffFCFCF8),
                                title: Text(
                                  textAlign: TextAlign.center,
                                  "Please fill all the fields",
                                  style: TextStyle(
                                      color: Color(0xffFE9801),
                                      fontSize: 16,
                                      fontFamily: "Rowdies"),
                                ),
                              ));
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
                            builder: (context) => const SignIn()));
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
