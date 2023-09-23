import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/widgets/Edit_res.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/Send_Done.dart';
import 'package:fajer/widgets/admin_bottom.dart';
import 'package:fajer/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class A_Res extends StatefulWidget {
  const A_Res({super.key});

  @override
  State<A_Res> createState() => _A_ResState();
}

class _A_ResState extends State<A_Res> {
  TextEditingController subjectcontroller = TextEditingController();
  TextEditingController subjectmarkcontroller = TextEditingController();
  TextEditingController subjectmarkoutcontroller = TextEditingController();
  TextEditingController usercontroller = TextEditingController();

  Future addresult(String subject, String subject_mark, String subject_mark_out,
      String user) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    await firestore.collection('results').add(
      {
        'subject': subject.toString(),
        'subject_mark': subject_mark.toString(),
        'subject_mark_out': subject_mark_out.toString(),
        'date': DateTime.now(),
        'name': user,
        'user': user + '@gmail.com'.toString(),
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
                      controller: subjectmarkcontroller,
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
                        hintText: 'النتيجة المقدرة',
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
                      controller: subjectmarkoutcontroller,
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
                        hintText: 'النتيجة الكاملة',
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
                          addresult(
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
              SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.height,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('results')
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
                                  trailing: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.brown.shade50,
                                          backgroundImage: const AssetImage(
                                              'assets/images/account.png'),
                                          radius: 80,
                                        ),
                                      ),
                                      Text(
                                        data['name'],
                                      ),
                                    ],
                                  ),
                                  leading: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      FirebaseFirestore.instance
                                          .collection('results')
                                          .doc(document.id)
                                          .delete();
                                    },
                                  ),
                                  onTap: () {
                                    print(subjectcontroller.text +
                                        subjectmarkcontroller.text);
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Edit_res(
                                            subject: data['subject'].toString(),
                                            docId: document.id,
                                            subject_mark:
                                                data['subject_mark'].toString(),
                                            subject_mark_out:
                                                data['subject_mark_out']
                                                    .toString(),
                                            name: data['name'].toString(),
                                          );
                                        });
                                  },
                                  contentPadding: const EdgeInsets.all(10),
                                  title: Text(
                                    data['subject'],
                                    textAlign: TextAlign.right,
                                  ),
                                  subtitle: Text(
                                    data['subject_mark'].toString() +
                                        '/' +
                                        data['subject_mark_out'].toString(),
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
              ),
            ],
          ),
        ),
        bottomNavigationBar: const Admin_Bottom(),
      ),
    );
  }
}
