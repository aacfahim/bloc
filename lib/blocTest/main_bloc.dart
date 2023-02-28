import 'dart:async';

import 'package:bloc/bloc.dart';

// void main() {
//   runApp( CounterBloc() as Widget);
// }

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        print(state);
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}

Future<void> main() async {
  var bloc = CounterBloc();

  final subscription = bloc.stream.listen(print);
  print(bloc.state);

  bloc.add(CounterEvent.increment);
  print(bloc.state);

  await Future.delayed(Duration.zero);
  //await subscription.cancel();
  await bloc.close();
}
