import 'package:flutter/material.dart';

class RememberMe extends ChangeNotifier{
  bool _isChecked = false;

  bool get isChecked => _isChecked;
  set(bool ch){_isChecked=ch;}
  void toggle (){
    _isChecked  = !_isChecked;
  }
}