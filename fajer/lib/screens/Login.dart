import 'package:fajer/screens/Home.dart';
import 'package:fajer/screens/Starter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fajer/providers/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  late String _name;
  late String _password;

  void submit() {
    Provider.of<Auth>(context, listen: false).login(
      credientials: {
        'name': _name,
        'password': _password,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formkey,
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
                  child: TextFormField(
                    initialValue: 'كامل عبد الرزاق الرفاعي',
                    onSaved: (value) {
                      _name = value.toString();
                    },
                    keyboardType: TextInputType.name,
                    style: TextStyle(fontFamily: 'A Jannat LT', height: 1),
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
                  child: TextFormField(
                    initialValue: 'std123',
                    onSaved: (value) {
                      _password = value.toString();
                    },
                    keyboardType: TextInputType.visiblePassword,
                    style: const TextStyle(
                        fontFamily: 'A Jannat LT', height: 1, fontSize: 16),
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
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
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF33DDE2)),
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
                      _formkey.currentState!.save();
                      this.submit();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
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
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 60,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: Color(0xFF33DDE2),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.50, color: Color(0xFF33DDE2)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    shadows: [
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
      ),
    );
  }
}
