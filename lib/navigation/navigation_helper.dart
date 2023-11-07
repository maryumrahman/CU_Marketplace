import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  static push(BuildContext context, Widget targetClass) {
    if (Platform.isIOS) {
      Navigator.of(context)
          .push(CupertinoPageRoute(builder: (context) => targetClass));
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => targetClass));
    }
  }

  static pushReplacement(BuildContext context, Widget targetClass) {
    if (Platform.isIOS) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => targetClass));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => targetClass));
    }
  }
  static pop(BuildContext context)=>Navigator.pop(context);
}