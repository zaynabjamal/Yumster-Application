import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/FavoritePages/othersPage.dart';
import 'package:gap/gap.dart';
import 'package:flutter_application/RegisterPages/signInpage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _success = 1;
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
                    color: Color(0xFFF697C37),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFFFF4E5),
                        hintText: "Username / Email",
                        hintStyle: const TextStyle(
                          color: Color(0xFFB0AA86),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Rowdies',
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                const Gap(30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xFFFFF4E5),
                        hintText: "Password",
                        hintStyle: const TextStyle(
                          color: Color(0xFFB0AA86),
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Rowdies',
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10))),
                    obscureText: true,
                  ),
                ),
                const Gap(50),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFFE9801),
                      minimumSize: Size(357, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    try {
                      _signin();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Others()));
                    } catch (e) {
                      print("Sign-in error: $e");
                    }
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        fontFamily: 'Rowdies',
                        color: Color(0xFFFFFFFF),
                        fontSize: 24),
                  ),
                ),
                const Gap(20),
                GestureDetector(
                  child: const Text(
                    "Create new account",
                    style: TextStyle(
                        color: Color(0xFFFE9801),
                        fontSize: 14,
                        fontFamily: 'Rowdies'),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
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
