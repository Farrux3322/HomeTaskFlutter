import 'package:default_project/blocs/users_bloc.dart';
import 'package:default_project/blocs/users_event.dart';
import 'package:default_project/blocs/users_state.dart';
import 'package:default_project/models/form_status.dart';
import 'package:default_project/models/user_model.dart';
import 'package:default_project/ui/users/widgets/global_text_fields.dart';
import 'package:default_project/utils/ui_utils/show_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/global_button.dart';


class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController jobTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Add User"),
        centerTitle: true,
      ),
      body: BlocConsumer<UsersBloc, UsersState>(
        builder: (context, state){
          return ListView(
            children: [
              const SizedBox(height: 30,),
              GlobalTextField(hintText: "FirstName", keyboardType: TextInputType.text, textInputAction: TextInputAction.done, textAlign: TextAlign.start, controller: firstNameController),
              GlobalTextField(hintText: "LastName", keyboardType: TextInputType.text, textInputAction: TextInputAction.done, textAlign: TextAlign.start, controller: lastNameController),
              GlobalTextField(hintText: "Age", keyboardType: TextInputType.number, textInputAction: TextInputAction.done, textAlign: TextAlign.start, controller: ageController),
              GlobalTextField(hintText: "Gender", keyboardType: TextInputType.text, textInputAction: TextInputAction.done, textAlign: TextAlign.start, controller: genderController),
              GlobalTextField(hintText: "Job Title", keyboardType: TextInputType.text, textInputAction: TextInputAction.done, textAlign: TextAlign.start, controller: jobTitleController),
              const SizedBox(height: 30,),
              GlobalButton(title: "Add User", onTap: (){
                if(firstNameController.text.isNotEmpty&&lastNameController.text.isNotEmpty&&ageController.text.isNotEmpty&&genderController.text.isNotEmpty&&jobTitleController.text.isNotEmpty){
                  BlocProvider.of<UsersBloc>(context).add(AddUser(newUser: UserModel(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    age: ageController.text,
                    gender: genderController.text,
                    jobTitle: jobTitleController.text,
                  )));
                }else{
                  showErrorMessage(message: "Malumotlar to'liq emas", context: context);
                }
              })
            ],
          );
        },
        listener: (context, state){
          if(state.status == FormStatus.success ){
            BlocProvider.of<UsersBloc>(context).add(GetUsers());
            Navigator.pop(context);
          }
          if(state.status == FormStatus.error){
            showErrorMessage(message: state.statusText, context: context);
          }
        },
      ),
    );
  }
}
