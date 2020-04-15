import 'package:flutter/material.dart';

class DarkData extends ChangeNotifier {
  bool isDark=true;

  void toggleDarkTheme(){
    isDark = !isDark;
    notifyListeners();
  }

}