import 'package:default_project/ui/home/counter_screen.dart';
import 'package:default_project/ui/home/second_screen.dart';
import 'package:default_project/ui/home/three_screen.dart';
import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter;

  CounterProvider({required int counter}) : _counter = counter {
    getWidgets();
  }

  int currentIndex = 0;



  get getCounter => _counter;

  set setCounter(int count) {
    _counter = count;
  }

  List<Widget> screens = [];
  Widget? widget;

  void getWidgets(){
    screens.add(CounterScreen());
    screens.add(SecondScreen());
    screens.add(ThreeScreen());
    widget = screens[0];
    notifyListeners();
  }

    getScreen(int index){
      widget =  screens[index];
      currentIndex = index;
      notifyListeners();
   }



  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
