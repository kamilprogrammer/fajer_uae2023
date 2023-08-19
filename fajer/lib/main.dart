import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/Starter.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/screens/behaviour.dart';
import 'package:fajer/screens/show_com.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fajer/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'fajer',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? user = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (user == 'kamel@gmail.com') {
            return Admin();
          } else {
            return Home();
          }
        } else {
          return Starter();
        }
      },
    );
  }
}
