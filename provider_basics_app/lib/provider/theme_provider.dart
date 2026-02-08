import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isdark = false;
  themechange() => _isdark;

  void toggle(value) {
    _isdark = value;
    notifyListeners();
  }
}
