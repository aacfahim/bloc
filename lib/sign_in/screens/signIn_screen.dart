import 'package:bloc_practice/sign_in/bloc/signIn_bloc.dart';
import 'package:bloc_practice/sign_in/bloc/signIn_event.dart';
import 'package:bloc_practice/sign_in/bloc/signIn_state.dart';
import 'package:bloc_practice/sign_in/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign in using business Logic Component")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(state.errorMessage.toString(),
                      style: TextStyle(color: Colors.red));
                } else {
                  return Container();
                }
              },
            ),
            TextField(
              controller: emailController,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailController.text, passwordController.text));
              },
              decoration: InputDecoration(label: Text("Email")),
            ),
            TextField(
              controller: passwordController,
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangedEvent(
                    emailController.text, passwordController.text));
              },
              decoration: InputDecoration(label: Text("Password")),
            ),
            SizedBox(height: 25),
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return ElevatedButton(
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                          SignInSubmittedEvent(
                              emailController.text, passwordController.text),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingScreen()));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: (state is SignInValidState)
                            ? Colors.blue
                            : Colors.grey),
                    child: Text("Login"));
              },
            )
          ],
        ),
      ),
    );
  }
}
