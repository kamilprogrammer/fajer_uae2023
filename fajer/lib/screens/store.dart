import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:fajer/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class product extends StatelessWidget {
  final String product_name;
  final String price;
  final String dis_price;

  product(
      {required this.product_name,
      required this.price,
      required this.dis_price});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 10),
          child: Container(
            width: 160,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 20,
                  offset: Offset(0, 10),
                  spreadRadius: 10,
                )
              ],
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                              spreadRadius: 10,
                            )
                          ],
                          color: Colors.white,
                        ),
                        child: Image(
                          width: 140,
                          height: 140,
                          image: AssetImage('assets/images/manage.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 160),
                      child: Text(
                        product_name,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Janna LT', fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'SYP',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontFamily: 'A Jannat LT',
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          int.parse(dis_price).toString().replaceAllMapped(
                              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]},'),
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red,
                            fontFamily: 'Janna LT',
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                          int.parse(price).toString().replaceAllMapped(
                              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (Match m) => '${m[1]},'),
                          style: TextStyle(
                            color: Colors.green,
                            fontFamily: 'Janna LT',
                            fontSize: 18,
                          ),
                        ),
                      ],
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

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
            'المتجر',
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
              SizedBox(
                height: 10,
              ),
              Text(
                'ملابس المدرسة',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Janna LT',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('store_clothes')
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
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return Padding(
                            padding:
                                EdgeInsets.only(left: 10, bottom: 45, top: 10),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: product(
                                product_name: data['product_name'],
                                price: data['price'],
                                dis_price: data['dis_price'],
                              ),
                            ),
                          );
                        },
                      ).toList(),
                    );
                  },
                ),
              ),
              Text(
                'ادوات المدرسة',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: 'Janna LT',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('store_tools')
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
                      scrollDirection: Axis.horizontal,
                      children: snapshot.data!.docs.map(
                        (DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;

                          return Padding(
                            padding:
                                EdgeInsets.only(left: 10, bottom: 45, top: 10),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: product(
                                product_name: data['product_name'],
                                price: data['price'],
                                dis_price: data['dis_price'],
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
