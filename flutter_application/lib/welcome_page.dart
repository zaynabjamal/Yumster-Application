import 'package:flutter/material.dart';
import 'package:flutter_application/register/login_page.dart';
import 'package:gap/gap.dart';
import 'package:flutter_application/register/sign_up_page.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFCFCF8),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Gap(MediaQuery.sizeOf(context).width * 0.1),
              Image.asset(
                "assets/DiscoverMeal.jpg",
                height: 350,
              ),
              Gap(MediaQuery.sizeOf(context).width * 0.105),
              const Text(
                "Discover Your\nFavorite Meals",
                style: TextStyle(
                    fontFamily: 'Rowdies',
                    color: Color(0xFFFE9801),
                    fontSize: 35),
              ),
              Gap(MediaQuery.sizeOf(context).width * 0.1),
              const Text(
                "Explore all the existing Recipe meals based on\nyour interest and want to learn",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFFB0AA86), fontSize: 14),
              ),
              Gap(MediaQuery.sizeOf(context).width * 0.14),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Sign In",
                          style:
                              TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style:
                            TextStyle(color: Color(0xFFFFFFFF), fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
