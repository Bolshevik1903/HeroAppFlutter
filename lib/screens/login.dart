import 'package:flutter/material.dart';

import '../data/remote/user_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userService = UserService();
  String _token = '';

  testAuthentication() async {
    final result = await _userService.test(_token);
    if (result != null) {
      print('Token: $_token');
      print('Total users ${result.length}');
    }
  }

  createUser() async {
    final result = await _userService.login(
        _usernameController.text, _passwordController.text);

    if (result != null) {
      _token = result.token;
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SuperHero'),
        ),
        body: Column(
          children: [
            TextField(
              controller: _usernameController,
              onChanged: (value) {},
            ),
            TextField(
              controller: _passwordController,
              onChanged: (value) {},
            ),
            OutlinedButton(
              onPressed: () {
                createUser();
              },
              child: const Text('Sign up'),
            ),
            OutlinedButton(
              onPressed: () {
                testAuthentication();
              },
              child: const Text('Sign up'),
            )
          ],
        ));
  }
}
