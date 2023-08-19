import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/Send_Done.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Complaint extends StatefulWidget {
  const Complaint({super.key});

  @override
  State<Complaint> createState() => _ComplaintState();
}

class _ComplaintState extends State<Complaint> {
  TextEditingController titlecontroller =
      TextEditingController(text: 'السلام عليكم');
  TextEditingController bodycontroller = TextEditingController(
      text:
          'السلام عليكم كيف الحال هذا البرنامج شيئ جدا بكل صراحة هههههههه لكن على الاقل افضل من البرنامج السابق الذي كان لا يعمل 😂😂😂');

  Future addcomplaint(String title, String body) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    final String? email = FirebaseAuth.instance.currentUser!.email;

    await firestore.collection('complaints').add(
      {
        'title': title,
        'body': body,
        'Time': DateTime.now(),
        'user': email,
      },
    ).then((value) {
      Navigator.of(context).pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF50D890),
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
          centerTitle: true,
          title: const Text(
            'تقديم شكوى',
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
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: TextField(
                      controller: titlecontroller,
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
                        hintText: 'العنوان',
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
                      controller: bodycontroller,
                      keyboardType: TextInputType.name,
                      style:
                          const TextStyle(fontFamily: 'A Jannat LT', height: 1),
                      textAlign: TextAlign.right,
                      maxLines: 12,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                              color: Color(0xFF33DDE2),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        hintText: 'الموضوع',
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
                      color: const Color(0xFFFF0000),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFFFF0000)),
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
                        if (bodycontroller.text.isNotEmpty) {
                          addcomplaint(
                                  titlecontroller.text, bodycontroller.text)
                              .then((value) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const Done();
                                });
                          });
                        }
                      },
                      child: const Text(
                        'إرسال الشكوى',
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
            ],
          ),
        ),
        bottomNavigationBar: const Bottom(),
      ),
    );
  }
}
