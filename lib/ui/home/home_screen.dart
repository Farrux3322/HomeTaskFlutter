import 'package:default_project/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<UserProvider>(context,listen: false);

    provider.getPerson();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Default Project"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          provider.isLoading ? const Text("Data yo'q"):
          Text(provider.person!.results.first.name.last),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        provider.getPerson();
        provider.changeLoading();
      },child: const Icon(Icons.apple),),
    );
  }
}
