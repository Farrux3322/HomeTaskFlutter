import 'package:default_project/cubits/login/login_state.dart';
import 'package:default_project/data/fairbase/auth_service.dart';
import 'package:default_project/data/models/universal_data.dart';
import 'package:default_project/utils/ui_utils/error_massage_dialog.dart';
import 'package:default_project/utils/ui_utils/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(InitialState());

  Future<void> signIn(
      BuildContext context, String login, String password) async {
    emit(SignInState(login: login, password: password));
    showLoading(context: context);
    UniversalData universalData =
        await AuthService.signUpUser(email: login, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(message: "User signed Up", context: context);
        emit(LoggedState());
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }

  }

  Future<void> signUp(BuildContext context, String login, String password,
      String username) async {
    emit(
      SignUpState(
        login: login,
        password: password,
        username: username,
      ),
    );
    showLoading(context: context);
    UniversalData universalData =
        await AuthService.loginUser(email: login, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }

    if (universalData.error.isEmpty) {
      if (context.mounted) {
        emit(LoggedState());
        // showConfirmMessage(message: "User logged", context: context);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }

  }

  logOutUser(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await AuthService.logOutUser();
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(
          message: universalData.data as String,
          context: context,
        );
        emit(UnAuthenticatedState());
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }

  }
}
