import 'package:fajer/screens/Starter.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:fajer/widgets/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF50D890),
            centerTitle: true,
            title: const Text(
              'الصفحة الرئيسية',
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
                      margin: const EdgeInsets.only(top: 46, bottom: 16),
                      child: const CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/account.png'),
                        radius: 80,
                        child: Stack(
                          children: [
                            Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.green)))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppText.artext['std_name']!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 141,
                      height: 43,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFF0000),
                        shape: RoundedRectangleBorder(
                          side:
                              BorderSide(width: 0.50, color: Color(0xFF33DDE2)),
                          borderRadius: BorderRadius.circular(25),
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
                          FirebaseAuth.instance.signOut().then((value) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Starter(),
                              ),
                            );
                          });
                        },
                        child: const Text(
                          'تسجيل الخروج',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Dubai',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(109, 0, 0, 0),
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              7.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                          minWidth: 100,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 28,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('الاعدادات'),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      Icons.settings,
                                      size: 28,
                                    ),
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(109, 0, 0, 0),
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              7.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                          minWidth: 100,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 28,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('الاعدادات'),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      Icons.settings,
                                      size: 28,
                                    ),
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(109, 0, 0, 0),
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              7.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                          minWidth: 100,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 28,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('الاعدادات'),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      Icons.settings,
                                      size: 28,
                                    ),
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(109, 0, 0, 0),
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              7.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                          minWidth: 100,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 28,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('الاعدادات'),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      Icons.settings,
                                      size: 28,
                                    ),
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 70,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(109, 0, 0, 0),
                            blurRadius: 15.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 5  horizontally
                              7.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 300,
                          minWidth: 100,
                        ),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 28,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('الاعدادات'),
                                  Container(
                                    height: 40,
                                    width: 40,
                                    child: Icon(
                                      Icons.settings,
                                      size: 28,
                                    ),
                                    margin: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD9D9D9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottomNavigationBar: const Bottom()),
    );
  }
}
