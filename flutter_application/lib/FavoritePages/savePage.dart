import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 59, right: 181),
          child: Image.asset('assets/logo.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 22,
                right: 10,
              ),
              child: SvgPicture.asset('assets/arcticons_recipe-keeper.svg'),
            ),
            const Text(
              'Saved Recipe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Color(0xffFE9801),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 34,
        ),
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
