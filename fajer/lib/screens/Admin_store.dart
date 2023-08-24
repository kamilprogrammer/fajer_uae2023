import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Edit_behaviours.dart';
import 'package:fajer/widgets/Edit_products.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/Send_Done.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:fajer/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class A_store extends StatefulWidget {
  const A_store({super.key});

  @override
  State<A_store> createState() => _A_storeState();
}

class _A_storeState extends State<A_store> {
  TextEditingController product_namecontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController dis_pricecontroller = TextEditingController();
  TextEditingController section_controller = TextEditingController();

  Future addproduct(String product_name, String price, String dis_price,
      String section, String img) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    if (_image != null) {
      if (section == 'ملابس') {
        uploadimage().then(
          (value) async {
            await firestore.collection('store').add(
              {
                'product_name': product_name.toString(),
                'price': price.toString(),
                'dis_price': dis_price.toString(),
                'date': DateTime.now(),
                'section': 'clothes',
                'img': imgUrl,
              },
            );
          },
        ).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
        );
      } else if (section == 'ادوات') {
        uploadimage().then(
          (value) async {
            await firestore.collection('store').add(
              {
                'product_name': product_name.toString(),
                'price': price.toString(),
                'dis_price': dis_price.toString(),
                'date': DateTime.now(),
                'section': 'tools',
                'img': imgUrl,
              },
            );
          },
        ).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
        );
      } else if (section == 'أدوات') {
        uploadimage().then(
          (value) async {
            await firestore.collection('store').add(
              {
                'product_name': product_name.toString(),
                'price': price.toString(),
                'dis_price': dis_price.toString(),
                'date': DateTime.now(),
                'section': 'tools',
                'img': imgUrl,
              },
            );
          },
        ).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
        );
      } else {
        uploadimage().then(
          (value) async {
            await firestore.collection('store').add(
              {
                'product_name': product_name.toString(),
                'price': price.toString(),
                'dis_price': dis_price.toString(),
                'date': DateTime.now(),
                'section': 'others',
                'img': imgUrl,
              },
            );
          },
        ).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
        );
      }
    } else {
      if (section == 'ملابس') {
        uploadimage().then(
          (value) async {
            await firestore.collection('store').add(
              {
                'product_name': product_name.toString(),
                'price': price.toString(),
                'dis_price': dis_price.toString(),
                'date': DateTime.now(),
                'section': 'clothes',
                'img': 'none',
              },
            );
          },
        ).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
        );
      } else if (section == 'ادوات') {
        uploadimage().then(
          (value) async {
            await firestore.collection('store').add(
              {
                'product_name': product_name.toString(),
                'price': price.toString(),
                'dis_price': dis_price.toString(),
                'date': DateTime.now(),
                'section': 'tools',
                'img': 'none',
              },
            );
          },
        ).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
        );
      } else if (section == 'أدوات') {
        uploadimage().then(
          (value) async {
            await firestore.collection('store').add(
              {
                'product_name': product_name.toString(),
                'price': price.toString(),
                'dis_price': dis_price.toString(),
                'date': DateTime.now(),
                'section': 'tools',
                'img': 'none',
              },
            );
          },
        ).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
        );
      } else {
        uploadimage().then(
          (value) async {
            await firestore.collection('store').add(
              {
                'product_name': product_name.toString(),
                'price': price.toString(),
                'dis_price': dis_price.toString(),
                'date': DateTime.now(),
                'section': 'others',
                'img': 'none',
              },
            );
          },
        ).then(
          (value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Admin()),
            );
          },
        );
      }
    }
  }

  File? _image;
  String imgUrl = "";
  Future pickimage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Error_login();
        },
      );
    }
  }

  Future uploadimage() async {
    try {
      String imgPath = _image!.path;
      String imgName = imgPath.split('/').last;
      final filepath = '/productsImages/$imgName';
      final ref = FirebaseStorage.instance.ref().child(filepath);
      final UploadTask task = ref.putFile(_image!);

      imgUrl = await (await task).ref.getDownloadURL();
      print(imgUrl);
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Error_login();
        },
      );
    }
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
            'المتجر الالكتروني',
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
                      controller: product_namecontroller,
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
                        hintText: 'اسم المنتج',
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
                      controller: pricecontroller,
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
                        hintText: 'السعر الحالي',
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
                      controller: dis_pricecontroller,
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
                        hintText: 'السعر القديم',
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
                      controller: section_controller,
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
                        hintText: 'ملابس او ادوات او غير ذلك',
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
                        pickimage().then(
                          (value) {
                            if (_image != null) {
                              uploadimage();
                            }
                          },
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_outlined,
                            color: Colors.white,
                          ),
                          Text(
                            'ارفاق صورة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Janna LT',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Text(
                'لايمكنك التعديل على الصورة بعد النشر',
                style: TextStyle(
                  fontFamily: 'A jannat LT',
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
              _image != null ? Image.file(_image!) : Container(),
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
                        if (product_namecontroller.text.isNotEmpty) {
                          addproduct(
                            product_namecontroller.text,
                            pricecontroller.text,
                            dis_pricecontroller.text,
                            section_controller.text,
                            imgUrl.toString(),
                          ).then(
                            (value) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const Send_Done();
                                  });
                            },
                          );
                        }
                      },
                      child: const Text(
                        'النشر',
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
                      .collection('store')
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
                                  icon: Icon(
                                    Icons.delete,
                                  ),
                                  onPressed: () {
                                    if (data['img'] != 'none') {
                                      FirebaseStorage.instance
                                          .refFromURL(
                                            data['img'],
                                          )
                                          .delete();
                                      FirebaseFirestore.instance
                                          .collection('store')
                                          .doc(document.id)
                                          .delete();
                                    } else {
                                      FirebaseFirestore.instance
                                          .collection('store')
                                          .doc(document.id)
                                          .delete();
                                    }
                                  },
                                ),
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Edit_pros(
                                          product_name: data['product_name'],
                                          price: data['price'],
                                          dis_price: data['dis_price'],
                                          section: data['section'],
                                          date: data['date'].toString(),
                                          docId: document.id,
                                        );
                                      });
                                },
                                contentPadding: const EdgeInsets.all(10),
                                title: Text(
                                  data['product_name'],
                                  textAlign: TextAlign.right,
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'SYP',
                                          style: TextStyle(
                                            fontFamily: 'A Jannat LT',
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          int.parse(
                                            data['price'],
                                          ).toString().replaceAllMapped(
                                              RegExp(
                                                  r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                              (Match m) => '${m[1]},'),
                                          style: TextStyle(
                                            color: Color(0xFF21BB68),
                                            fontFamily: 'Janna LT',
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'SYP',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontFamily: 'A Jannat LT',
                                            fontSize: 12,
                                          ),
                                        ),
                                        Text(
                                          int.parse(data['dis_price'])
                                              .toString()
                                              .replaceAllMapped(
                                                  RegExp(
                                                      r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                                                  (Match m) => '${m[1]},'),
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.red,
                                            fontFamily: 'Janna LT',
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
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
            ],
          ),
        ),
        bottomNavigationBar: const Bottom(),
      ),
    );
  }
}
