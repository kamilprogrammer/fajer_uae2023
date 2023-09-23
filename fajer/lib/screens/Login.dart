import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/Starter.dart';
import 'package:fajer/screens/admin.dart';
import 'package:fajer/widgets/Done.dart';
import 'package:fajer/widgets/Errors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController namecontroller =
      TextEditingController(text: 'kamel');
  late TextEditingController passwordcontroller =
      TextEditingController(text: 'kamIL044');

  Future SinginWithNameandPass(String name, String password, context) async {
    try {
      // ignore: unused_local_variable
      final creds = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: name + '@gmail.com', password: password)
          .then((value) {
        if (FirebaseAuth.instance.currentUser!.email == 'kamel@gmail.com') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Admin(),
                    ),
                  );
                });
                return const Done();
              });
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              });
              return const Done();
            },
          );
        }
      });
    } catch (e) {
      return showDialog(
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
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(80),
                    width: 150,
                    height: 150,
                    decoration: ShapeDecoration(
                      image: const DecorationImage(
                        image: AssetImage('assets/images/logo.jpg'),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x7F000000),
                          blurRadius: 28,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'تسجيل الدخول',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'Janna LT',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: namecontroller,
                  style: const TextStyle(fontFamily: 'A Jannat LT', height: 1),
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    hintText: 'الاسم',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: TextField(
                  controller: passwordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                      fontFamily: 'A Jannat LT', height: 1, fontSize: 16),
                  textAlign: TextAlign.right,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.remove_red_eye),
                    hintText: 'كلمة السر',
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width - 60,
                height: 52,
                decoration: ShapeDecoration(
                  color: const Color(0xFF33DDE2),
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFF33DDE2)),
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
                  onPressed: () {
                    SinginWithNameandPass(
                        namecontroller.text, passwordcontroller.text, context);
                  },
                  child: const Text(
                    'المتابعة',
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
              Container(
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width - 60,
                height: 52,
                decoration: ShapeDecoration(
                  color: const Color(0xFF33DDE2),
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFF33DDE2)),
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Starter(),
                      ),
                    );
                  },
                  child: const Text(
                    '<-------',
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
        ),
      ),
    );
  }
}
