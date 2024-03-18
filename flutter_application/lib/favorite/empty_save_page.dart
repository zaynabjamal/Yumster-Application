import 'package:flutter/material.dart';

class EmptySave extends StatelessWidget {
  const EmptySave({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset(
            'assets/illustration.png',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const Text(
          'No recipes? Lets start cooking up some\n tasty adventures!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Color(0xffFE9801),
          ),
        ),
      ],
    );
  }
}
