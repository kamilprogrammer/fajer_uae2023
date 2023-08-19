import 'package:flutter/material.dart';

class Error_login extends StatefulWidget {
  const Error_login({super.key});

  @override
  State<Error_login> createState() => _Error_loginState();
}

class _Error_loginState extends State<Error_login> {
  late String e;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Container(
        width: MediaQuery.of(context).size.width - 60,
        height: 200,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Icon(
                    Icons.error,
                    color: Colors.red,
                    size: 50,
                  ),
                ],
              ),
              Text(
                'ERROR!',
                style: TextStyle(
                    fontFamily: 'Janna Lt',
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
