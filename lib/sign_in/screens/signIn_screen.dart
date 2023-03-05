import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign in using business Logic Component")),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text("Username")),
          ),
          TextField(
            decoration: InputDecoration(label: Text("Password")),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Login"))
        ],
      ),
    );
  }
}
