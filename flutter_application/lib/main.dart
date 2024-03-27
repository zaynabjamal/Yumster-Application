import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/provider/bookmark.dart';
import 'package:flutter_application/welcome_page.dart';
import 'package:flutter_application/screens/others_screen.dart';
import 'package:flutter_application/screens/breakfast_screen.dart';
import 'package:flutter_application/screens/diet_screen.dart';
import 'package:flutter_application/screens/lunch_screen.dart';
import 'package:flutter_application/screens/seafood_screen.dart';
import 'package:flutter_application/screens/vegan_screen.dart';
import 'package:provider/provider.dart';

// ignore: unused_element
final FirebaseAuth _auth = FirebaseAuth.instance;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyC71akjLPt9ihJhbFEuvTsk5iox__OBDnA",
      appId: "1:933352697122:web:f11c8361302f4a0fc2897b",
      messagingSenderId: "933352697122",
      projectId: "yumsterapp-c7dc5",
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookmarkProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Welcome(),
        theme: ThemeData(fontFamily: 'Rowdies'),
        routes: {
          '/breakfast': (context) => const Breakfast(),
          '/lunch': (context) => const Lunch(),
          '/diet': (context) => const Diet(),
          '/vegan': (context) => const Vegan(),
          '/sea': (context) => const Sea(),
          '/others': (context) => const Others(),
        },
      ),
    );
  }
}
