import 'package:fajer/screens/Home.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF50D890),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 16.0,
            ),
          ),
          centerTitle: true,
          title: const Text(
            'معلومات اضافية',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Janna LT',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    child: const Text(
                      'تواصل معنا',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.facebook),
                      color: Color.fromARGB(255, 51, 220, 226),
                      iconSize: 34,
                    ),
                    width: 51,
                    height: 51,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.instagram),
                      color: Color.fromARGB(255, 51, 220, 226),
                      iconSize: 30,
                    ),
                    width: 51,
                    height: 51,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                          spreadRadius: 10,
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {},
                      icon: FaIcon(FontAwesomeIcons.whatsapp),
                      color: Color.fromARGB(255, 51, 220, 226),
                      iconSize: 30,
                    ),
                    width: 51,
                    height: 51,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 20,
                          offset: Offset(0, 10),
                          spreadRadius: 10,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'عن التطبيق',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Janna LT',
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: 150,
                height: 150,
                decoration: ShapeDecoration(
                  image: const DecorationImage(
                    image: AssetImage('assets/images/logo.jpg'),
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
              const SizedBox(
                height: 10,
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
            ],
          ),
        ),
        bottomNavigationBar: Bottom(),
      ),
    );
  }
}
