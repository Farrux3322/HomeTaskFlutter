abstract class LoginState {}

class InitialState extends LoginState {}

class SignInState extends LoginState {
  final String login;
  final String password;

  SignInState({required this.password, required this.login});
}

class SignUpState extends LoginState {
  final String login;
  final String password;
  final String username;

  SignUpState(
      {required this.password, required this.login, required this.username});
}

class LoggedState extends LoginState {}

class UnAuthenticatedState extends LoginState {}
