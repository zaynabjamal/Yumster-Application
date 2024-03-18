import 'package:flutter/material.dart';
import 'package:flutter_application/home/home_screen.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/entrySuccess.png"),
            const Text(
              "You're In",
              style: TextStyle(
                  fontFamily: 'Rowdies',
                  fontSize: 52,
                  color: Color(0xFFFE9801)),
            ),
            const Text(
              "Get ready to recreate\nthe best Recipies! ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Rowdies',
                  fontSize: 32,
                  color: Color(0xFFB0AA86)),
            ),
          ],
        ),
      ),
    );
  }
}
