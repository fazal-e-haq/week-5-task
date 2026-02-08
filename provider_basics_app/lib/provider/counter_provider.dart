import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void incriment() {
    _count++;
    notifyListeners();
  }

  void decriment() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }
}
