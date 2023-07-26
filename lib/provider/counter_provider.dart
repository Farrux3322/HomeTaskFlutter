import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter;

  CounterProvider({required int counter}) : _counter = counter {}

  get getCounter => _counter;

  set setCounter(int count) {
    _counter = count;
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
