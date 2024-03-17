import 'package:flutter/material.dart';
import 'package:flutter_application/RegisterPages/entrysuccessPage.dart';
import 'package:flutter_application/RegisterPages/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  late bool _success;
  late String _userEmail;
  late String _userName;
  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
        _userName = _userNameController.text;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(
                  color: Color(0xFFF697C37),
                  fontFamily: 'Rowdies',
                  fontSize: 32,
                ),
              ),
              const Text(
                "Create an account so you can explore all the \n               existing jobs",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Rowdies',
                    color: Color(0xFFB0AA86)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFFF4E5),
                      hintText: "Username",
                      hintStyle: const TextStyle(
                        color: Color(0xFF626262),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFFF4E5),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        color: Color(0xFF626262),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFFF4E5),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Color(0xFF626262),
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFE9801),
                    minimumSize: const Size(357, 55),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  _register();
                  CollectionReference collRef =
                      FirebaseFirestore.instance.collection('users');
                  collRef.add({
                    'Username': _userNameController.text,
                    'Email': _emailController.text
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuccessPage()));
                },
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                      fontFamily: 'Rowdies',
                      color: Color(0xFFFFFFFF),
                      fontSize: 24),
                ),
              ),
              GestureDetector(
                child: const Text(
                  "Already have an account",
                  style: TextStyle(
                      color: Color(0xFFFE9801),
                      fontSize: 14,
                      fontFamily: 'Rowdies'),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Login()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
