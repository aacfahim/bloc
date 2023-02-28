import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);

  // Stream<int> countStream(int max) async* {
  //   for (int i = 0; i < max; i++) {
  //     yield i;
  //   }
  // }

  // Future<int> sumStream(Stream<int> stream) async {
  //   int sum = 0;
  //   await for (int value in stream) {
  //     sum += value;
  //   }

  //   return sum;
  // }

  //cubits emits a new state, a Change will register
  // Change { currentState: 0, nextState: 1 }
  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
}

/*  NOTE */
/*
cubit is a component with functions, emits states that mofidy UI.
bloc is advanced, emits stream of states but also stream of events.


*/

void main(List<String> args) async {
  final cubit = CounterCubit();
  // print(cubit.state); // initial state is 0
  // cubit.increment(); // state value should be incremented here
  // print(cubit.state); // now state value would be 1
  // cubit.increment();
  // print(cubit.state); // state 2
  // cubit.increment();
  // print(cubit.state); // state 3
  // cubit.decrement(); //  state value will be decremented from here
  // print(cubit.state); // state value would be 2
  // cubit.close();
  // print(cubit.state);

  // Cubit exposes a Stream which allows us to receive real-time state updates

  final subs = cubit.stream.listen(print);
  cubit.increment();
  cubit.increment();
  cubit.decrement();
  await Future.delayed(Duration.zero);
  await subs.cancel();
  await cubit.close();

  // Stream<int> stream = cubit.countStream(4);

  // int sum = await cubit.sumStream(stream);
  // print(sum);
}
