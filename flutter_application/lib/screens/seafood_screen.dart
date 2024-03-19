import 'package:flutter/material.dart';

class Sea extends StatefulWidget {
  const Sea({super.key});

  @override
  State<Sea> createState() => _SeaState();
}

class _SeaState extends State<Sea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFE9801),
      ),
      body:const Center(
        child: Text('HI'),
      ),
    );
  }
}
