import 'package:fajer/screens/About.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Admin_Bottom extends StatefulWidget {
  const Admin_Bottom({super.key});

  @override
  State<Admin_Bottom> createState() => _Admin_BottomState();
}

class _Admin_BottomState extends State<Admin_Bottom> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF50D890),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _current,
        onTap: (int newindex) {
          setState(() {
            _current = newindex;

            if (_current == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              );
            }
            if (_current == 1) {
              if (FirebaseAuth.instance.currentUser!.email ==
                  'kamel@gmail.com') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Admin(),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              }
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'حول التطبيق',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسية',
          ),
        ],
      ),
    );
  }
}
