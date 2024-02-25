import 'package:flutter/material.dart';
class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/entrySuccess.png"),
         const Text("You're In",style: TextStyle(
            fontFamily: 'Rowdies',
            fontSize: 52,
            color: const Color(0xFFFFE9801)
          ),),
         const Text("Get ready to create\n       culinary magic",style: TextStyle(
            fontFamily: 'Rowdies',
            fontSize: 32,
            color: Color(0xFFB0AA86)
          ),),
        ],
      ),
    );
  }
}