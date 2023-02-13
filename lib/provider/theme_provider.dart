import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get getThemeMode => _themeMode;

  void setTheme (ThemeMode themeMode){
    _themeMode = themeMode;
    notifyListeners();
  }
}