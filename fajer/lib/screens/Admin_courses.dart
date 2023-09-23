import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Edit_courses.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/Send_Done.dart';
import 'package:fajer/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class A_Course extends StatefulWidget {
  const A_Course({super.key});

  @override
  State<A_Course> createState() => _A_CourseState();
}

class _A_CourseState extends State<A_Course> {
  TextEditingController coursecontroller = TextEditingController();
  TextEditingController urlcontroller = TextEditingController();

  Future addcourse(
    String course,
    String url,
  ) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('Courses').add(
      {
        'course': course.toString(),
        'url': url.toString(),
        'date': DateTime.now(),
      },
    ).then((value) {
      if (FirebaseAuth.instance.currentUser!.email == 'kamel@gmail.com') {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
            'اضافة كورس',
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
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextField(
                      controller: coursecontroller,
                      keyboardType: TextInputType.name,
                      style:
                          const TextStyle(fontFamily: 'A Jannat LT', height: 1),
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF33DDE2),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'اسم الكورس',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextField(
                      controller: urlcontroller,
                      keyboardType: TextInputType.name,
                      style:
                          const TextStyle(fontFamily: 'A Jannat LT', height: 1),
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF33DDE2),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'الرابط',
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 60,
                    height: 52,
                    decoration: ShapeDecoration(
                      color: const Color.fromARGB(255, 0, 195, 255),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50,
                            color: Color.fromARGB(255, 0, 195, 255)),
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
                      //السلام عليكم كيف الحال هذا البرنامج شيئ جدا بكل صراحة هههههههه لكن على الاقل افضل من البرنامج السابق الذي كان لا يعمل 😂😂😂
                      onPressed: () {
                        if (coursecontroller.text.isNotEmpty) {
                          addcourse(
                            coursecontroller.text,
                            urlcontroller.text,
                          ).then((value) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Send_Done();
                                });
                          });
                        }
                      },
                      child: const Text(
                        'الإرسال',
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
              const SizedBox(
                height: 10,
              ),
              Text(
                'الارسالات السابقة',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Janna LT',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 80,
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Courses')
                      .orderBy('date', descending: true)
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
                      shrinkWrap: true,
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(80, 0, 255, 64),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: ListTile(
                                leading: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    FirebaseFirestore.instance
                                        .collection('Courses')
                                        .doc(document.id)
                                        .delete();
                                  },
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Edit_courses(
                                          course: data['course'],
                                          docId: document.id,
                                          url: data['url'],
                                        );
                                      });
                                },
                                contentPadding: const EdgeInsets.all(10),
                                title: Text(
                                  data['course'],
                                  textAlign: TextAlign.right,
                                ),
                                subtitle: Text(
                                  data['url'],
                                  textAlign: TextAlign.right,
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
            ],
          ),
        ),
      ),
    );
  }
}
