import 'package:flutter/material.dart';
import 'package:flutter_application/RegisterPages/loginPage.dart';
import 'package:gap/gap.dart';
import 'package:flutter_application/RegisterPages/signInpage.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(10),
            Image.asset("assets/DiscoverMeal.jpg"),
            const Gap(40),
            const Text(
              "Discover Your\nFavorite Meals",
              style: TextStyle(
                  fontFamily: 'Rowdies',
                  color: Color(0xFFFE9801),
                  fontSize: 35),
            ),
            const Gap(60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFE9801),
                      minimumSize: const Size(160, 60),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Rowdies',
                          color: Color(0xFFFFFFFF),
                          fontSize: 24),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignIn()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF697C37),
                      minimumSize: const Size(160, 60),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontFamily: 'Rowdies',
                          color: Color(0xFFFFFFFF),
                          fontSize: 24),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
