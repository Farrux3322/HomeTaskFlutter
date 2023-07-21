import 'dart:math';

import 'package:flutter/material.dart';

class HomeTask extends StatefulWidget {
  const HomeTask({Key? key}) : super(key: key);

  @override
  State<HomeTask> createState() => _HomeTaskState();
}

class _HomeTaskState extends State<HomeTask> with TickerProviderStateMixin{

  late AnimationController animationController;
  late Animation<double> animation;

  late AnimationController animation1;
  late Animation<double> animation2;


  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween<double>(begin: 25, end: 50).animate(
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
    animation1 = AnimationController(vsync: this,duration: Duration(seconds: 3),);
    animation1.addListener(() {
      setState(() {

      });
    });
    animation1.forward();
    animation2 = Tween<double>(begin: 0,end: 2*pi).animate(animation1);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 300,horizontal: 70),
          child: Transform.rotate(
            angle: animation2.value,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: FlutterLogo(size: 100,),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FlutterLogo(size: 100,),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: FlutterLogo(size: 100,),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: FlutterLogo(size: 100,),
                ),

              ],
            ),
          ),
        ),
        floatingActionButton:FloatingActionButton(onPressed: (){
          animationController.forward();
          setState(() {});
        },child: Icon(Icons.car_crash,size: animation.value,),)
    );
  }
}
