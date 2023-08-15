import 'package:fajer/providers/auth.dart';
import 'package:fajer/screens/Starter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:fajer/screens/Home.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Auth(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage = new FlutterSecureStorage();

  void _attemptauthintication() async {
    final String? key = await storage.read(key: 'auth');
    Provider.of<Auth>(context, listen: false).attempt(key.toString());
  }

  @override
  void initState() {
    _attemptauthintication();
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Consumer<Auth>(
        builder: (context, auth, child) {
          if (auth.authinticated) {
            return Home();
          } else {
            return Starter();
          }
        },
      ),
    );
  }
}
