import 'package:bloc_practice/sign_in/bloc/signIn_bloc.dart';
import 'package:bloc_practice/sign_in/screens/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => SignInBloc(),
                    child: SignIn(),
                  ),
                )),
            child: Text("GO TO SIGN IN")),
      ),
    );
  }
}
