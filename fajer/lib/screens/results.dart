import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:fajer/widgets/text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  late String mark1 = AppText.artext['s1m']!;
  late String mark1s = mark1.substring(0, 3);
  late String mark1sout = mark1.substring(4, 7);
  late int nmark1 = int.parse(mark1s);
  late String mark2 = AppText.artext['s2m']!;
  late String mark2s = mark2.substring(0, 3);
  late String mark2sout = mark2.substring(4, 7);
  late int nmark2 = int.parse(mark2s);
  late String mark3 = AppText.artext['s3m']!;
  late String mark3s = mark3.substring(0, 2);
  late String mark3sout = mark3.substring(3, 5);
  late int nmark3 = int.parse(mark3s);
  late String mark4 = AppText.artext['s4m']!;
  late String mark4s = mark4.substring(0, 2);
  late String mark4sout = mark4.substring(3, 5);
  late int nmark4 = int.parse(mark4s);
  late int nmark1out = int.parse(mark1sout);
  late int nmark2out = int.parse(mark2sout);
  late int nmark3out = int.parse(mark3sout);
  late int nmark4out = int.parse(mark4sout);
  late int res = nmark1 + nmark2 + nmark3 + nmark4;
  late int res2 = res * 100;
  late int out = nmark4out + nmark3out + nmark2out + nmark1out;
  late double result = res2 / out;
  late String results = result.toString();
  late String mainresult = results.substring(0, 4);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF50D890),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
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
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 16.0,
            ),
          ),
          title: const Text(
            'نتائج الامتحانات',
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
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'المعدل النهائي',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: 'Janna LT',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            child: Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            width: 40,
                            height: 40,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: OvalBorder(),
                              shadows: [
                                BoxShadow(
                                  color: Color(0xFF50D890),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                  spreadRadius: 5,
                                )
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            mainresult,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 38,
                              fontFamily: 'veneer',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    width: 130,
                    height: 130,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0xFF50D890),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                          spreadRadius: 5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width - 60,
                decoration: const ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  color: Color.fromARGB(167, 80, 216, 143),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.artext['s1m']!,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      AppText.artext['s1']!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width - 60,
                decoration: const ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  color: Color.fromARGB(167, 80, 216, 143),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.artext['s2m']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      AppText.artext['s2']!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width - 60,
                decoration: const ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  color: Color.fromARGB(167, 80, 216, 143),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.artext['s3m']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      AppText.artext['s3']!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 29,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width - 60,
                decoration: const ShapeDecoration(
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 10,
                      offset: Offset(0, 10),
                      spreadRadius: 0,
                    )
                  ],
                  color: Color.fromARGB(167, 80, 216, 143),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppText.artext['s4m']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      AppText.artext['s4']!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Janna LT',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 29,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const Bottom(),
      ),
    );
  }
}
