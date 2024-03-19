//TODO Zaynab

import 'package:flutter/material.dart';
import 'package:flutter_application/profilepage/profile_page.dart';
import 'package:flutter_svg/svg.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: const Color(0xffFCFCF8),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()));
            },
            icon: SvgPicture.asset("assets/arrowBack.svg")),
        centerTitle: true,
        title: const Text(
          'Help',
          style: TextStyle(
            color: Color(0xffFE9801),
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: const Center(child: Text('TODO ZAYNAB JAMAL')),
    ));
  }
}