import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DotList extends StatelessWidget {
  final String text;
  const DotList({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.circle,
              color: Color(0xffB0AA86),
              size: 13,
            ),
            const Gap(8),
            Text(
              text,
              style: const TextStyle(
                  color: Color(0xffB0AA86),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
        const Gap(13),
      ],
    );
  }
}
