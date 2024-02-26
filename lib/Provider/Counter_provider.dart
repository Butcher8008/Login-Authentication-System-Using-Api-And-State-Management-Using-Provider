import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier{
  int count=0;
  int get counter=> count;
  void setCount() {
    count++;
    notifyListeners();
  }
}