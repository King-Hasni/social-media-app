import 'package:flutter/material.dart';

class prove extends ChangeNotifier{
  int current = 0;
  String? profilePic;
  bool hasData = false;
  Map<String,dynamic> data = {};
  void changeValue(int value){
    current = value;
    notifyListeners();
  }
  late BuildContext context;
  void add(Map<String,dynamic> items){
    data = items;
    if(data.isNotEmpty){
    profilePic =  data["profile"];

    }
    ChangeNotifier();
  }

}