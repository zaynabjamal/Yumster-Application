import 'package:flutter/material.dart';

class HelpData extends StatelessWidget {
  final String number;
  final String title;
  final String sentence;
  const HelpData(
      {required this.number,
      required this.title,
      required this.sentence,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: number + ". ",
            style: const TextStyle(
                color: Color(0XFFFE9801), fontSize: 14, fontFamily: "Rowdies")),
        TextSpan(
            text: title + ": ",
            style: const TextStyle(
                color: Color(0XFF697C37), fontSize: 14, fontFamily: "Rowdies")),
        TextSpan(
            text: sentence + ". ",
            style: const TextStyle(
                color: Color(0XFFB0AA86), fontSize: 14, fontFamily: "Rowdies")),
      ])),
    );
  }
}
