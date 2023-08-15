import 'dart:convert';
import 'dart:developer';
import 'package:fajer/dio.dart';
import 'package:fajer/models/student.dart';
import 'package:fajer/screens/Starter.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Auth extends ChangeNotifier {
  final storage = new FlutterSecureStorage();
  bool _authinticated = false;
  late Student _student;
  bool get authinticated => _authinticated;

  Student get student => _student;
  Future login({required Map<String, String> credientials}) async {
    _authinticated = true;

    Dio.Response response = await dio().post(
      'auth/token',
      data: json.encode(credientials),
    );
    String token = json.decode(response.toString())['token'];

    await attempt(token);
    storeToken(token);
  }

  Future attempt(String token) async {
    try {
      Dio.Response response = await dio().get(
        'student',
        options: Dio.Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      _student = Student.formJson(
        json.decode(
          response.toString(),
        ),
      );
      _authinticated = true;
    } catch (e) {
      log(e.toString());
      _authinticated = false;
      return Starter();
    }
    notifyListeners();
  }

  storeToken(String token) async {
    await storage.write(key: 'auth', value: token);
  }

  Future getToken() async {
    return await storage.read(key: 'auth');
  }

  void logout() {
    _authinticated = false;

    notifyListeners();
  }
}
