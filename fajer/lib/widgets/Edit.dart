import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Send_Done.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Edit_com extends StatefulWidget {
  final String title;
  final String docId;
  final String body;
  const Edit_com(
      {super.key,
      required this.title,
      required this.docId,
      required this.body});

  @override
  State<Edit_com> createState() => _Edit_comState();
}

class _Edit_comState extends State<Edit_com> {
  TextEditingController titleeditcontroller = TextEditingController();
  TextEditingController bodyeditcontroller = TextEditingController();

  @override
  void initState() {
    bodyeditcontroller.text = widget.body;
    titleeditcontroller.text = widget.title;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width - 60,
          height: MediaQuery.of(context).size.height - 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 70,
                    ),
                    Icon(
                      Icons.edit_document,
                      color: Colors.blueAccent,
                      size: 50,
                    ),
                  ],
                ),
                const Text(
                  '!' + 'تعديل البلاغ',
                  style: TextStyle(
                      fontFamily: 'Janna Lt',
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                      child: TextField(
                        controller: titleeditcontroller,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                            fontFamily: 'A Jannat LT', height: 1),
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
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 120,
                      child: TextField(
                        controller: bodyeditcontroller,
                        keyboardType: TextInputType.name,
                        style: TextStyle(fontFamily: 'A Jannat LT', height: 1),
                        textAlign: TextAlign.right,
                        maxLines: 12,
                        decoration: InputDecoration(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      width: MediaQuery.of(context).size.width - 120,
                      height: 52,
                      decoration: ShapeDecoration(
                        color: Color.fromARGB(189, 0, 255, 68),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50,
                              color: Color.fromARGB(189, 0, 255, 68)),
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
                          Future editcomplaint(
                              String title, String body) async {
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;

                            // ignore: unused_local_variable
                            final String? email =
                                FirebaseAuth.instance.currentUser!.email;

                            await firestore
                                .collection('complaints')
                                .doc(widget.docId)
                                .update(
                              {
                                'title': title,
                                'body': body,
                                'Time': DateTime.now(),
                              },
                            ).then((value) {
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
                            });
                          }

                          if (bodyeditcontroller.text.isNotEmpty) {
                            editcomplaint(titleeditcontroller.text,
                                    bodyeditcontroller.text)
                                .then((value) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Send_Done();
                                  });
                            });
                          }
                        },
                        child: const Text(
                          'تعديل الشكوى',
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
        ),
      ),
    );
  }
}
