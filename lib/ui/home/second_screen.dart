import 'package:default_project/ui/home/three_screen.dart';
import 'package:flutter/material.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("BUILDING HOME SCREEEN");
    return Scaffold(
      appBar: AppBar(
        title: Text("Deafult screen"),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const ThreeScreen()));
        }, icon:const Icon(Icons.next_plan))],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
