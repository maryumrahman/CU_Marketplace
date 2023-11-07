import 'package:flutter/material.dart';
export 'package:flutter/material.dart';


extension ColorExtension on Color {
  Color op(double op) => withOpacity(op);
}

extension Space on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}

extension MediaQueryExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  Orientation get orientation => MediaQuery.of(this).orientation;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension WrapSpace on Widget {
  Widget space({double? height, double? width}) => SizedBox(
    height: height,
    width: width,
    child: this,
  );
}

extension BoxString on String {
  Widget box({double? height, double? width}) => SizedBox(
    height: height,
    width: width,
    child: Text(this),
  );
}

//
// red.op(3)
// 3.width
// SizedBox with empty: 4.height
// SizedBox with widget: Container.space(height:10, width:10)
// context.screenWidth*0.7
// context.orientation
// context.theme
// context.textTheme
// context.colorScheme