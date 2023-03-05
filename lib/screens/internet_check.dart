import 'package:bloc_practice/internet_check/blocs/internet_bloc.dart';
import 'package:bloc_practice/internet_check/blocs/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCheck extends StatelessWidget {
  const InternetCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainedState) {
            return Center(child: Text("Internet Connected"));
          } else if (state is InternetLostState) {
            return Center(child: Text("Internet Lost"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
