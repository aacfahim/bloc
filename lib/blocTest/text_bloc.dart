import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class StringEvent {}

class UpdateStringEvent extends StringEvent {
  final String name;
  UpdateStringEvent(this.name);
}

class StringState {
  final String text;
  StringState(this.text);
}

class TextBloc extends Bloc<StringEvent, StringState> {
  TextBloc() : super(StringState("null")) {
    on<UpdateStringEvent>(
      (event, emit) {
        emit(StringState(event.name));
      },
    );
  }

  @override
  Stream<StringState> mapEventToState(StringEvent event) async* {
    if (event is UpdateStringEvent) {
      yield StringState(event.name);
    }
  }

  // CounterBloc() : super(0) {
  //   on<CounterIncrementPressed>((event, emit) {
  //     emit(state + 1);
  //   });
  // }
}

class TextHome extends StatelessWidget {
  TextHome({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TextBloc>(
      create: (context) => TextBloc(),
      child: BlocBuilder<TextBloc, StringState>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: nameController,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<TextBloc>(context)
                            .add(UpdateStringEvent(nameController.text));
                      },
                      child: const Text("Add")),
                  Text(state.text),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
