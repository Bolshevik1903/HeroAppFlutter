import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class HttpHelper {
  final String userUrl = "http://10.11.78.229/api/v1/users/sign-up";
  final String signUpUrl = "sign-up";
  final String signInUrl = "sign-in";

  Future<bool> createUser(String username, String password) async {
    final user = User.short(username: username, password: password);
    final result = await http.post(Uri.parse(userUrl + signUpUrl),
        headers: {"Content-Tyoe": "application/json"},
        body: jsonEncode({user.toJson()}));

    if (result.statusCode == HttpStatus.ok) {
      //final jsonResponse = jsonDecode(result.body);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login(String username, String password) async {
    final result = await http.post(Uri.parse(userUrl + signInUrl),
        headers: {"Content-Tyoe": "application/json"},
        body: jsonEncode({'username': username, 'password': password}));

    if (result.statusCode == HttpStatus.ok) {
      //final jsonResponse = jsonDecode(result.body);
      return true;
    } else {
      return false;
    }
  }
}
