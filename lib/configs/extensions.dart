import 'package:flutter/material.dart';

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