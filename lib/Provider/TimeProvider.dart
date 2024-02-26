import 'package:flutter/material.dart';
import 'dart:async';

class TimeProvider extends ChangeNotifier {
  DateTime time = DateTime.now();

  DateTime get timeNow => time;

  void setTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      time = DateTime.now();
      notifyListeners();
    });
  }
}
