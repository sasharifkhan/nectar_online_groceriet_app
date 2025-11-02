import 'package:flutter/material.dart';

class Appscreenswitch extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex =>_selectedIndex;
  
  appscreenswitch(int index){
    _selectedIndex = index;
    notifyListeners();
  }
}