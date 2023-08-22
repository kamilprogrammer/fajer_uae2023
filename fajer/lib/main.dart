import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/Starter.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/screens/store.dart';
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
  runApp(const MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (FirebaseAuth.instance.currentUser!.email == 'kamel@gmail.com') {
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
