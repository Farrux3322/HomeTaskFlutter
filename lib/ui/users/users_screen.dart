import 'package:default_project/blocs/users_event.dart';
import 'package:default_project/blocs/users_state.dart';
import 'package:default_project/models/user_model.dart';
import 'package:default_project/ui/users/sub_screens/add_user_screen.dart';
import 'package:default_project/ui/users/sub_screens/update_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/users_bloc.dart';
import '../../models/form_status.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Screen"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Stack(
          children: [
            BlocConsumer<UsersBloc, UsersState>(
                builder: (context, state){
                  return state.users.isNotEmpty ? ListView(
                    children: [
                      ...List.generate(state.users.length, (index) {
                        UserModel userModel = state.users[index];
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 5,
                                    blurRadius: 10
                                )
                              ]
                          ),
                          child: ListTile(
                            leading: IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return UpdateUserScreen(userModel: userModel);
                              }));
                            },icon: Icon(Icons.edit),),
                            title: Text(userModel.firstName,style: TextStyle(fontSize: 24),),
                            subtitle: Text(userModel.lastName),
                            trailing: IconButton(
                              onPressed: (){
                                BlocProvider.of<UsersBloc>(context).add(DeleteUser(id: userModel.id!));
                                BlocProvider.of<UsersBloc>(context).add(GetUsers());
                              },
                              icon:const Icon(Icons.delete,color: Colors.red,),
                            ),
                          ),
                        );
                      })
                    ],
                  ) : const Center(child: Text("Empty"),);
                },
                listener: (context, state){

                }
            ),
            Visibility(
              visible:
              context.watch<UsersBloc>().state.status == FormStatus.loading,
              child: const Align(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const AddUserScreen();
          }));
        },child: Icon(Icons.add_circle_outline,size: 30,),
      ),
    );
  }
}
