import 'package:default_project/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextButton(onPressed: (){
            context.read<AuthProvider>().updateTheme();
          }, child: const Text("Theme",style: TextStyle(fontSize: 32),)),
          SizedBox(height: 100,),
          TextButton(onPressed: (){
            context.read<AuthProvider>().logOut(context);
          }, child: const Text("Log out",style: TextStyle(fontSize: 32),))
        ],
      ),
    );
  }
}
