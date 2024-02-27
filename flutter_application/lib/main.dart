import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application/Catagories/welcome.dart';
import 'package:flutter_application/FavoritePages/othersPage.dart';
import 'package:flutter_application/RegisterPages/loginPage.dart';
import 'package:flutter_application/RegisterPages/signInpage.dart';
import 'package:flutter_application/provider/Bookmark.dart';
import 'package:provider/provider.dart';

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
      create: (context) => bookmarkProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
