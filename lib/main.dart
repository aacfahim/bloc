import 'package:bloc_practice/blocTest/text_bloc.dart';
import 'package:bloc_practice/internet_check/blocs/internet_bloc.dart';
import 'package:bloc_practice/internet_check/cubits/internet_cubit.dart';
import 'package:bloc_practice/internet_check/screens/internet_check.dart';
import 'package:bloc_practice/sign_in/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetCubit(),
      child: MaterialApp(
        home: Welcome(),
      ),
    );
  }
}
