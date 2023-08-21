import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:fajer/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  const Results({super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('percent')
                      .where('user',
                          isEqualTo: FirebaseAuth.instance.currentUser!.email
                              .toString())
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Error_login();
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    }
                    return ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return Row(
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
                                        data['percent'].toString(),
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
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 60,
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('results')
                      .where('user',
                          isEqualTo: FirebaseAuth.instance.currentUser!.email)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return const Error_login();
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Loading();
                    }
                    return ListView(
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(60, 3, 168, 244),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      data['subject_mark'].toString() +
                                          '/' +
                                          data['subject_mark_out'].toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Janna LT',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      data['subject'],
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
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
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
