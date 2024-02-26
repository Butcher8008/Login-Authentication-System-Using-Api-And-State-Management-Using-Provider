import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  var theme = ThemeMode.light;
  ThemeMode get themeChange=> theme;

  void setTheme (themeChange){
    theme = themeChange;
    notifyListeners();
  }
}