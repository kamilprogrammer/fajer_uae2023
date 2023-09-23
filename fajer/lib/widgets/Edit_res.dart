import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Send_Done.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Edit_res extends StatefulWidget {
  final String subject;
  final String subject_mark;
  final String subject_mark_out;
  final String name;
  final String docId;
  const Edit_res({
    super.key,
    required this.docId,
    required this.subject,
    required this.subject_mark,
    required this.subject_mark_out,
    required this.name,
  });

  @override
  State<Edit_res> createState() => _Edit_resState();
}

class _Edit_resState extends State<Edit_res> {
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController subjectmarkcontroller = TextEditingController();
  TextEditingController subjectmarkoutcontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();

  @override
  void initState() {
    subjectcontroller.text = widget.subject;
    subjectmarkcontroller.text = widget.subject_mark;
    subjectmarkoutcontroller.text = widget.subject_mark_out;
    usercontroller.text = widget.name;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  '!' + 'تعديل الملف',
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
                        controller: subjectcontroller,
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
                          hintText: 'اسم المادة',
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
                        controller: subjectmarkcontroller,
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
                          hintText: 'العلامة المقدرة',
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
                        controller: subjectmarkoutcontroller,
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
                          hintText: 'العلامة الكاملة',
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
                        controller: usercontroller,
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
                          hintText: 'اسم الطالب',
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
                          Future editresults(
                              String subject,
                              String subject_mark,
                              String subject_mark_out,
                              String name) async {
                            FirebaseFirestore firestore =
                                FirebaseFirestore.instance;

                            // ignore: unused_local_variable
                            final String? email =
                                FirebaseAuth.instance.currentUser!.email;

                            await firestore
                                .collection('results')
                                .doc(widget.docId)
                                .update(
                              {
                                'subject': subject,
                                'subject_mark': subject_mark,
                                'subject_mark_out': subject_mark_out,
                                'name': name,
                                'user': name + '@gmail.com',
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

                          if (subjectcontroller.text.isNotEmpty) {
                            editresults(
                                    subjectcontroller.text,
                                    subjectmarkcontroller.text,
                                    subjectmarkoutcontroller.text,
                                    usercontroller.text)
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
                          'تعديل الملف',
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
