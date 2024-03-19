import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AboutUsText extends StatelessWidget {
  final String text;
  const AboutUsText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Color(0xffFE9801),
            ),
            const Gap(15),
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xff697C37),
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        const Gap(13),
      ],
    );
  }
}
