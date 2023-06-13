import 'package:flutter/material.dart';
import 'package:superhero_flutter/data/remote/http_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final httpHelper = HttpHelper();

  createUser() async {
    final result = await httpHelper.createUser(
        usernameController.text, passwordController.text);

    if (result) {}
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
        body: Column(
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
          onPressed: () {},
          child: const Text("Sign Up"),
        ),
      ],
    ));
  }
}
