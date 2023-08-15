import 'package:fajer/screens/Login.dart';
import 'package:flutter/material.dart';

class Starter extends StatefulWidget {
  const Starter({super.key});

  @override
  State<Starter> createState() => _StarterState();
}

class _StarterState extends State<Starter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    scale: 2.0,
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x7F000000),
                      blurRadius: 28,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              const Text(
                'Al-Fajer-App',
                style: TextStyle(
                  color: Color(0xFF5B4F4F),
                  fontSize: 16,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                'version: 2.0.0',
                style: TextStyle(
                  color: Color(0xFF5B5050),
                  fontSize: 16,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 160,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 60,
                height: 52,
                decoration: ShapeDecoration(
                  color: Color(0xFF33DDE2),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 0.50, color: Color(0xFF33DDE2)),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(0, 244, 67, 54),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    );
                  },
                  child: const Text(
                    'التالي',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Janna LT',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
