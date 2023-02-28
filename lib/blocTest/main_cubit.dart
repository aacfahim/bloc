import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

void main(List<String> args) {
  final cubit = CounterCubit();
  print(cubit.state); // initial state is 0
  cubit.increment(); // state value should be incremented here
  print(cubit.state); // now state value would be 1
  cubit.increment();
  print(cubit.state); // state 2
  cubit.increment();
  print(cubit.state); // state 3
  cubit.decrement(); //  state value will be decremented from here
  print(cubit.state); // state value would be 2
  cubit.close();
  print(cubit.state);
}
