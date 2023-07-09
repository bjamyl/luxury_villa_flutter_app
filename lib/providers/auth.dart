import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Map<String, String> authData = {
    'email': '',
    'password': '',
    're_password': ''
  };

  Map<String, String> loginData = {'email': '', "password": ''};

  Future<void> signup() async {
    final url = Uri.parse('http://10.0.2.2:8000/auth/users/');
    final res = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(authData));
    print(res.body);
  }

  Future<void> signin() async {
    final url = Uri.parse('http://10.0.2.2:8000/auth/jwt/create/');
    final res = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(loginData));
    print(res.body);
  }
}
