
import 'package:bloc_practice/internet_check/blocs/internet_bloc.dart';
import 'package:bloc_practice/internet_check/blocs/internet_state.dart';
import 'package:bloc_practice/internet_check/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCheck extends StatelessWidget {
  const InternetCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<InternetCubit, InternetCubitState>(
      listener: (context, state) {
        if (state == InternetCubitState.Gained) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Internet Connected"),
              backgroundColor: Colors.green));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Internet Disconnected"),
              backgroundColor: Colors.red));
        }
      },
      builder: (context, state) {
        if (state == InternetCubitState.Gained) {
          return Center(child: Text("Internet Connected"));
        } else if (state == InternetCubitState.Lost) {
          return Center(child: Text("Internet Lost"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
