import 'package:flutter/material.dart';
import '../data/remote/user_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();
    final _userService = UserService();

  createUser() async {
    final result = await _userService.createUser(_usernameController.text, _passwordController.text);

    if (result){
      print(result);
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
        )
      ],
    ));
  }
}