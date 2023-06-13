import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:superhero_flutter/data/model/authtentication.dart';

import '../model/user.dart';

class HttpHelper {
  final String userUrl = "http://10.11.78.229/api/v1/users";
  final String signUpUrl = "/sign-up";
  final String signInUrl = "/sign-in";

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

  Future<Authentication?> login(String username, String password) async {
    final result = await http.post(Uri.parse(userUrl + signInUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({'username': username, 'password': password}));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = jsonDecode(result.body);
      return Authentication.fromJson(jsonResponse);
    } else {
      return null;
    }
  }

  Future<List<User>?> test(String token) async {
    final result = await http.get(Uri.parse(userUrl),
        headers: {HttpHeaders.authorizationHeader: token});

    if (result.statusCode == HttpStatus.ok) {
      final List jsonResponse = jsonDecode(result.body);

      return jsonResponse.map((map) => User.fromJson(map)).toList();
    } else {
      return null;
    }
  }
}
