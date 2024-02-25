import 'package:flutter/material.dart';

class Vegan extends StatefulWidget {
  const Vegan({super.key});

  @override
  State<Vegan> createState() => _VeganState();
}

class _VeganState extends State<Vegan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFE9801),
      ),
      body: Center(
        child: Text('HI'),
      ),
    );
  }
}
