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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  int _success = 1;
  // ignore: unused_field
  String _userEmail = " ";

  void _signin() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      User? user = userCredential.user;

      if (user != null) {
        setState(() {
          _success = 2;
          _userEmail = user.email!;
        });
      } else {
        setState(() {
          _success = 3;
        });
      }
    } catch (e) {
      print("Error signing in: $e");
      setState(() {
        _success = 3;
      });
    }
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
                  controller: _emailController,
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
                    try {
                      _signin();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    } catch (e) {
                      print("Sign-in error: $e");
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
