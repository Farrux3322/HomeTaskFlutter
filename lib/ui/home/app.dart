import 'package:default_project/provider/auth_provider.dart';
import 'package:default_project/ui/home/login.dart';
import 'package:default_project/ui/home/tab_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: context.read<AuthProvider>().listenAuthState(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data == null) {
            return const LoginScreen();
          } else {
            return  TabBoxScreen();
          }
        },
      ),
    );
  }
}
