import 'package:flutter/material.dart';
import 'package:superhero_flutter/data/remote/http_helper.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final httpHelper = HttpHelper();
  String _token = '';

  loginApp() async {
    final result = await httpHelper.login(
        usernameController.text, passwordController.text);

    if (result != null) {
      print(result.token);
      _token = result.token;
    }
  }

  testAuth() async {
    final result = await httpHelper.test(_token);
    result?.length;
    if (result != null) {
      print("Token: ${_token}");
      print("Total users ${result.length}");
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          TextField(
            controller: usernameController,
            onChanged: (value) {},
          ),
          TextField(
            controller: passwordController,
            onChanged: (value) {},
          ),
          OutlinedButton(
            onPressed: () {
              loginApp();
            },
            child: const Text("Sign In"),
          ),
          OutlinedButton(
            onPressed: () {
              testAuth();
            },
            child: const Text("Test Auth"),
          ),
        ],
      ),
    ));
  }
}
