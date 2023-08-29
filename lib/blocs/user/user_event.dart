import 'package:default_project/data/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class AddUser extends UserEvent {
  final UserModel newUser;

  AddUser({required this.newUser});

  @override
  List<Object?> get props => [newUser];
}

class GetUser extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUser extends UserEvent {
  final UserModel updateUser;

  UpdateUser({required this.updateUser});

  @override
  List<Object?> get props => [updateUser];
}

class DeleteUser extends UserEvent {
  final int userId;

  DeleteUser({required this.userId});

  @override
  List<Object?> get props => [userId];
}
