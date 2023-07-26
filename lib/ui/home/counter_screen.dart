import 'package:default_project/provider/counter_provider.dart';
import 'package:default_project/ui/home/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILDING HOME SCREEEN");

    var provider = Provider.of<CounterProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("Deafult screen"),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const SecondScreen()));
        }, icon:const Icon(Icons.next_plan))],
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
          TextButton(
              onPressed: () {
                provider.increment();
              },
              child: Text("Increment")),
          TextButton(
              onPressed: () {
                provider.decrement();
              },
              child: Text("Decrement")),
        ],
      ),
    );
  }
}
