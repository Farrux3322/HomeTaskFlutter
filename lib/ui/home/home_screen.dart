import 'package:default_project/blocs/user/user_bloc.dart';
import 'package:default_project/blocs/user/user_event.dart';
import 'package:default_project/blocs/user/user_state.dart';
import 'package:default_project/data/models/form_status.dart';
import 'package:default_project/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users CRUD BLOC"),
      ),
      body: Stack(
        children: [
          BlocConsumer<UserBloc, UsersState>(
            builder: (context, state) {
              return state.users.isNotEmpty
                  ? ListView(
                children: [
                  ...List.generate(state.users.length, (index) {
                    UserModel userModel = state.users[index];
                    return ListTile(
                      leading: IconButton(
                        onPressed: () {
                          context
                              .read<UserBloc>()
                              .add(DeleteUser(userId: userModel.userId));
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<UserBloc>().add(
                            UpdateUser(
                              updateUser: UserModel(
                                userId: userModel.userId,
                                userName:
                                "Updated User ${userModel.userName}",
                                age: 25,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.red,
                        ),
                      ),
                      title: Text(userModel.userName),
                      subtitle: Text(userModel.userId.toString()),
                    );
                  })
                ],
              )
                  : const Center(child: Text("EMPTY !!!"));
            },
            listener: (context, state) {},
          ),
          Visibility(
            visible:
            context.watch<UserBloc>().state.status == FormStatus.loading,
            child: const Align(child: CircularProgressIndicator()),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(
                  AddUser(
                      newUser: UserModel(
                          age: 19,
                          userId: DateTime.now().microsecondsSinceEpoch,
                          userName: "Falonchi")),
                );
              },
              heroTag: "add",
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(GetUser());
              },
              heroTag: "get",
              child: const Icon(Icons.get_app),
            ),
          ],
        ),
      ),
    );
  }
}
