import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:luxury_villa/models/http_exceptions.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiryDate;
  String? _userId;

  Map<String, String> authData = {
    'email': '',
    'password': '',
    're_password': ''
  };

//Method for Creating a new user
  Future<void> signup() async {
    final url = Uri.parse('http://10.0.2.2:8000/auth/users/');
    try {
      final res = await http.post(url,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(authData));

      final resBody = json.decode(res.body);
      print(resBody);
      if (resBody['email'][0].toString().contains('email already exists')) {
        throw HttpException(resBody['email'][0]);
      } else if (resBody['password'] != null) {
        throw HttpException(resBody['password'][0]);
      }
    } catch (e) {
      rethrow;
    }
  }

//Method for handling login functionality. Returns a refresh and access token from JWT endpoint
  Future<void> login() async {
    final url = Uri.parse('http://10.0.2.2:8000/auth/jwt/create/');
    final res = await http.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(
            {"email": authData["email"], "password": authData["password"]}));
    print(res.body);
  }
}
