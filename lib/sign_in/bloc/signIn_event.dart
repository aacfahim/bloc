abstract class SignInEvent {}

class SignInTextChangedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;

  SignInTextChangedEvent(this.emailValue, this.passwordValue);
}

class SignInSubmittedEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;

  SignInSubmittedEvent(this.emailValue, this.passwordValue);
}
