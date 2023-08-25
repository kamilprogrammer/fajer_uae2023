import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:fajer/widgets/bottombar.dart';
import 'package:fajer/widgets/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class product extends StatelessWidget {
  final String product_name;
  final String price;
  final String dis_price;
  final String img;
  final String docId;

  product({
    required this.product_name,
    required this.price,
    required this.dis_price,
    required this.docId,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Product_screen(
                      img: img,
                      dis_price: dis_price,
                      price: price,
                      product_name: product_name,
                      docId: docId),
                ),
              );
            },
            child: Container(
              width: 160,
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                shadows: [
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
                          child: img.toString() == 'none'
                              ? Container()
                              : Container(
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
                                  ),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    width: 140,
                                    height: 140,
                                    image: NetworkImage(img),
                                  ),
                                )),
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
                          style:
                              TextStyle(fontFamily: 'Janna LT', fontSize: 18),
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
                      .collection('store')
                      .where('section', isEqualTo: 'clothes')
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
                                docId: document.id,
                                img: data['img'],
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
                      .collection('store')
                      .where('section', isEqualTo: 'tools')
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
                                docId: document.id,
                                img: data['img'],
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
                'غير ذلك',
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
                      .collection('store')
                      .where('section', isEqualTo: 'others')
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
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 45, top: 10),
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: product(
                                product_name: data['product_name'],
                                price: data['price'],
                                dis_price: data['dis_price'],
                                docId: document.id,
                                img: data['img'],
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

class Product_screen extends StatelessWidget {
  final String product_name;
  final String price;
  final String dis_price;
  final String docId;
  final String img;
  Product_screen(
      {required this.product_name,
      required this.dis_price,
      required this.price,
      required this.docId,
      required this.img});

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Store(),
                ),
              );
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 16.0,
            ),
          ),
          title: Text(
            product_name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Janna LT',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        product_name,
                        style: TextStyle(
                          fontFamily: 'A Jannat LT',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: img == 'none'
                      ? Container()
                      : Container(
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
                          ),
                          child: Image(
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width - 100,
                            height: 200,
                            image: NetworkImage(img),
                          ),
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              'SYP',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontFamily: 'A Jannat LT',
                                fontSize: 12,
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
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Row(
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
                                color: Color(0xFF21BB68),
                                fontFamily: 'Janna LT',
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    try {
                      String text =
                          ' السلام عليكم اريد طلب"$product_name" العدد:\n اللون:\n القياس:\n';
                      print(text);
                      launch('https://wa.me/971503037657/?text= $text');
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const Error_login();
                          });
                    }
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color(0xFF21BB68),
                    ),
                    height: 40,
                    width: MediaQuery.of(context).size.width - 60,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            FontAwesomeIcons.whatsapp,
                            color: Colors.white,
                          ),
                          Text(
                            'الطلب عن طريق الواتس',
                            style: const TextStyle(
                                fontFamily: 'Janna LT',
                                fontSize: 16,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Bottom(),
      ),
    );
  }
}
