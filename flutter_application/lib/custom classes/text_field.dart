import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;


  const CustomTextField({super.key, required this.label, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFFFF4E5),
            hintText: label,
            hintStyle: const TextStyle(
              color: Color(0xFF626262),
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            )),
      ),
    );
  }
}
