import 'package:default_project/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreeScreen extends StatelessWidget {
  const ThreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILDING HOME SCREEEN");
    return Scaffold(
      appBar: AppBar(
        title: Text("Deafult screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CounterProvider>(
              builder: (context,counterProvider,child){
                return Text(
                  counterProvider.getCounter.toString(),
                  style: const TextStyle(fontSize: 45),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
