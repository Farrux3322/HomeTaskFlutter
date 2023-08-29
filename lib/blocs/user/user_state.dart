import 'package:default_project/data/models/form_status.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

class UsersState extends Equatable {
  const UsersState({
    required this.status,
    required this.statusText,
    required this.users,
  });

  final FormStatus status;
  final List<UserModel> users;
  final String statusText;

  UsersState copyWith({
    FormStatus? status,
    List<UserModel>? users,
    String? statusText,
  }) =>
      UsersState(
        status: status ?? this.status,
        statusText: statusText ?? this.statusText,
        users: users ?? this.users,
      );

  @override
  List<Object?> get props => [status, statusText, users];
}
