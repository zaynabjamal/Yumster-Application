import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/custom%20classes/text_field.dart';
import 'package:flutter_application/register/entry_success_page.dart';
import 'package:flutter_application/register/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _userNameController = TextEditingController();
  // ignore: unused_field
  late bool _success;
  // ignore: unused_field
  late String _userEmail;
  // ignore: unused_field
  late String _userName;
  void _register() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
            email: _emailController.text, password: _passwordController.text))
        .user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email!;
      });
    } else {
      setState(() {
        _success = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.width * 0.15,
              ),
              child: Column(
                children: [
                  const Text(
                    "Create Account",
                    style: TextStyle(
                      color: Color(0xFF697C37),
                      fontSize: 32,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.03,
                  ),
                  const Text(
                    "Create an account so you can explore all the\nexisting Recipies!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Color(0xFFB0AA86)),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.14,
                  ),
                  CustomTextField(
                    label: 'Username',
                    controller: _userNameController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.09,
                  ),
                  CustomTextField(
                    label: 'Email',
                    controller: _emailController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.09,
                  ),
                  CustomTextField(
                    label: 'Password',
                    controller: _passwordController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.09,
                  ),
                  const CustomTextField(label: 'Confirm Password'),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.15,
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
                      "Sign Up",
                      style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.08,
                  ),
                  GestureDetector(
                    child: const Text(
                      "Already Have An Account?",
                      style: TextStyle(
                        color: Color(0xFFFE9801),
                        fontSize: 14,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
