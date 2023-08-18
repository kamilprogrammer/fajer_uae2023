import 'package:fajer/screens/About.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/complaint.dart';
import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            }
            if (_current == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Complaint(),
                ),
              );
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'حول التطبيق',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline),
            label: 'تقديم شكوى',
          ),
        ],
      ),
    );
  }
}
