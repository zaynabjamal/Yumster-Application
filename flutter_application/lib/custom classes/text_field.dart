import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool hideText;


  const CustomTextField({super.key, required this.label, this.controller, required this.hideText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        obscureText: hideText,
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFF4E5),
            hintText: label,
            hintStyle: const TextStyle(
              color: Color(0xFFB0AA86),
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff697C37)),
              borderRadius: BorderRadius.circular(10)
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
