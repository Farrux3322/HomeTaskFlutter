import 'package:default_project/cubits/login/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  Future<void> signIn(String login, String password) async {
    emit(SignInState(login: login, password: password));
    await Future.delayed(const Duration(seconds: 3));
    emit(LoggedState());
  }

  Future<void> signUp(String login, String password, String username) async {
    emit(
      SignUpState(
        login: login,
        password: password,
        username: username,
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    emit(LoggedState());
  }

  logOutUser() {
    emit(UnAuthenticatedState());
  }
}
