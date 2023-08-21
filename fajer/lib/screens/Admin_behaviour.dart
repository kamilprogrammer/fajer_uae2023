import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Edit.dart';
import 'package:fajer/widgets/Edit_behaviours.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/Send_Done.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:fajer/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class A_Behaviour extends StatefulWidget {
  const A_Behaviour({super.key});

  @override
  State<A_Behaviour> createState() => _A_BehaviourState();
}

class _A_BehaviourState extends State<A_Behaviour> {
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController notecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();

  Future addbehaviour(
      String subject, String note, String date, String user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('behaviours').add(
      {
        'subject': subject.toString(),
        'note': note.toString(),
        'Time': date.toString(),
        'date': DateTime.now(),
        'name': user,
        'user': user + '@gmail.com'.toString(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF50D890),
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
            'سلوك الطالب',
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
                      controller: subjectcontroller,
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
                        hintText: 'اسم المادة',
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
                      controller: notecontroller,
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
                        hintText: 'الملاحظة',
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
                      controller: datecontroller,
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
                        hintText: 'التاريخ',
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
                      controller: usercontroller,
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
                    width: MediaQuery.of(context).size.width - 60,
                    height: 52,
                    decoration: ShapeDecoration(
                      color: Color.fromARGB(255, 0, 195, 255),
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
                        if (subjectcontroller.text.isNotEmpty) {
                          addbehaviour(
                                  subjectcontroller.text,
                                  notecontroller.text,
                                  datecontroller.text,
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
                width: MediaQuery.of(context).size.width - 60,
                height: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('behaviours')
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
                                        .collection('behaviours')
                                        .doc(document.id)
                                        .delete();
                                  },
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Edit_bes(
                                          subject: data['subject'],
                                          note: data['note'],
                                          name: data['name'],
                                          date: data['Time'],
                                          docId: document.id,
                                        );
                                      });
                                },
                                contentPadding: const EdgeInsets.all(10),
                                title: Text(
                                  data['subject'],
                                  textAlign: TextAlign.right,
                                ),
                                subtitle: Text(
                                  data['note'].toString(),
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
        bottomNavigationBar: const Bottom(),
      ),
    );
    ;
  }
}
