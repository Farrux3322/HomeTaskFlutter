import 'package:default_project/blocs/user/user_event.dart';
import 'package:default_project/blocs/user/user_state.dart';
import 'package:default_project/data/models/form_status.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UsersState> {
  UserBloc() :super(
      const UsersState(status: FormStatus.pure, statusText: "", users: [])
  ){
    on<AddUser>(_addUser);
    on<GetUser>(_getUsers);
    on<UpdateUser>(_updateUser);
    on<DeleteUser>(_deleteUser);
  }

  _addUser(AddUser event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Adding User...",
      ),
    );
    await Future.delayed(const Duration(seconds: 3));
    emit(
      state.copyWith(
          status: FormStatus.success,
          statusText: "Data added successfully!",
          users: [...state.users, event.newUser]),
    );
  }

  _getUsers(GetUser event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Getting Users...",
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: "Users fetched !!!",
        users: [
          ...state.users,
          UserModel(age: 21, userId: DateTime.now().microsecondsSinceEpoch, userName: "Alijon"),
          UserModel(age: 22, userId: DateTime.now().microsecondsSinceEpoch, userName: "Solijon"),
          UserModel(age: 23, userId: DateTime.now().microsecondsSinceEpoch, userName: "Valijon"),
        ],
      ),
    );
  }
  _updateUser(UpdateUser event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Updating User...",
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    List<UserModel> currentUsers = state.users;
    for (int i = 0; i < currentUsers.length; i++) {
      if (event.updateUser.userId == currentUsers[i].userId) {
        currentUsers[i] = event.updateUser;
      }
    }
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: "Users updated !!!",
        users: currentUsers,
      ),
    );
  }

  _deleteUser(DeleteUser event, Emitter<UsersState> emit) async {
    emit(
      state.copyWith(
        status: FormStatus.loading,
        statusText: "Deleting User...",
      ),
    );
    await Future.delayed(const Duration(seconds: 2));
    List<UserModel> currentUsers = state.users;

    currentUsers.removeWhere((element) => element.userId == event.userId);
    emit(
      state.copyWith(
        status: FormStatus.success,
        statusText: "Users deleted !!!",
        users: currentUsers,
      ),
    );
  }


}