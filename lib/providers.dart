import 'package:flutter/material.dart';

class prove extends ChangeNotifier{
  int current = 0;
  void changeValue(int value){
    current = value;
    notifyListeners();
  }
}