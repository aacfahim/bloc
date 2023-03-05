import 'package:bloc_practice/sign_in/bloc/signIn_event.dart';
import 'package:bloc_practice/sign_in/bloc/signIn_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState("Please enter a valid email"));
      } else if (event.passwordValue.length <= 7) {
        emit(SignInErrorState("Please enter a strong password"));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
