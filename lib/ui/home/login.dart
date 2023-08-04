import 'package:default_project/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: context.read<AuthProvider>().emailController,
              decoration:const InputDecoration(
                border: OutlineInputBorder(),
                label:  Text("Email")
              ),
            ),
            SizedBox(height: 25,),
            TextField(
              controller:  context.read<AuthProvider>().passwordController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                label:  Text("Password")
              ),
            ),
            SizedBox(height: 25,),
            TextButton(onPressed: (){
              context.read<AuthProvider>().signUpUser(context);
            }, child: const Text("Login")),
            SizedBox(height: 25,),
            TextButton(onPressed: (){}, child: const Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
