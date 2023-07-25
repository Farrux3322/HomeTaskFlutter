import 'package:default_project/data/models/user_model.dart';
import 'package:default_project/data/network/user_repository.dart';
import 'package:default_project/status/form_status.dart';
import 'package:default_project/status/universal_data.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  final UserRepository userRepository;

  UserProvider({required this.userRepository}){
    fetchUsersData();
  }

  String errorText = "";

  FormStatus status = FormStatus.pure;

  List<UserModel>? users;

  fetchUsersData() async {
    notify(FormStatus.loading);
    UniversalData universalData = await userRepository.getAllUsers();
    if (universalData.error.isEmpty) {
      notify(FormStatus.success);
      users = universalData.data as List<UserModel>;
    } else {
      errorText = universalData.error;
      notify(FormStatus.failure);
    }
  }

  notify(FormStatus value) {
    status = value;
    notifyListeners();
  }
}
