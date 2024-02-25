import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application/profilepage/profilePage.dart';

final FirebaseAuth _auth=FirebaseAuth.instance;
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb){
    await Firebase.initializeApp(options:const FirebaseOptions(apiKey:  "AIzaSyC71akjLPt9ihJhbFEuvTsk5iox__OBDnA", appId: "1:933352697122:web:f11c8361302f4a0fc2897b", messagingSenderId: "933352697122", projectId: "yumsterapp-c7dc5"));
  }
  await Firebase.initializeApp();
   runApp(
     const MyApp(),
    
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
    debugShowCheckedModeBanner: false,
     home:ProfilePage() ,
     
    );
  }
}
