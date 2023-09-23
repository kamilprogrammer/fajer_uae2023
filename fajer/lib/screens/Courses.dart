import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Course extends StatefulWidget {
  const Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  Future<void> _openlink(String link) async {
    try {
      launch(link);
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return const Error_login();
          });
    }
  }

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
            'الكورسات',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Janna LT',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('Courses')
                          .orderBy('date', descending: true)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const Error_login();
                              });
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          children: snapshot.data!.docs.map(
                            (DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;

                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 20, right: 20),
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
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          String url = data['url'].toString();
                                          if (url.substring(0, 5) == 'https') {
                                            _openlink(url);
                                          } else {
                                            _openlink('https://' + url);
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 30,
                                              width: 30,
                                              decoration: const BoxDecoration(
                                                color: Color(0xFFD9D9D9),
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(20),
                                                ),
                                              ),
                                              child: const Icon(
                                                Icons.arrow_back,
                                                size: 28,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 130),
                                                  child: Text(
                                                    data['course'],
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'A jannat LT'),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.all(4),
                                                  width: 40,
                                                  height: 40,
                                                  child: CircleAvatar(
                                                    backgroundColor:
                                                        Colors.brown.shade50,
                                                    backgroundImage:
                                                        const AssetImage(
                                                            'assets/images/manage.png'),
                                                    radius: 80,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              );
                            },
                          ).toList(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Bottom(),
      ),
    );
  }
}
