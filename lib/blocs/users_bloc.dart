import 'package:default_project/blocs/users_event.dart';
import 'package:default_project/blocs/users_state.dart';
import 'package:default_project/local/local_database.dart';
import 'package:default_project/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/form_status.dart';
import '../models/user_model.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc()
      : super(
    const UsersState(
      status: FormStatus.pure,
      statusText: "",
      users: [],
    ),
  ) {
    on<AddUser>(_addUser);
    on<GetUsers>(_getUsers);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  _addUser(AddUser event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.userAdd,
      ),
    );
    await LocalDatabase.insertUser(event.newUser);
    emit(
      state.copyWith(
          status: FormStatus.success,
          statusText: StatusTextConstants.userAdd,
          users: [...state.users, event.newUser]),
    );
  }

  _getUsers(GetUsers event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.gotAllUsers,
      ),
    );
    List<UserModel> newUsers = await LocalDatabase.getAllUsers();
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: StatusTextConstants.gotAllUsers,
        users: newUsers,
      ),
    );
  }

  _updateUser(UpdateUser event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.userUpdate,
      ),
    );
    await LocalDatabase.updateUser(userModel: event.updatedUser);

    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: StatusTextConstants.userUpdate,
      ),
    );
  }

  _deleteUser(DeleteUser event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: StatusTextConstants.userDelete,
      ),
    );
    await LocalDatabase.deleteUser(event.id);
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: StatusTextConstants.userDelete,
      ),
    );
  }
}