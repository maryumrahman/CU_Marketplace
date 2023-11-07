import 'package:flutter/foundation.dart';

class AppTextFieldProvider extends ChangeNotifier {
  bool _obscureText = false;

  initObscureText(bool val) {
    _obscureText = val;
    notifyListeners();
  }

  toggle() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  bool get obscureText => _obscureText;

  set obscureText(bool value) {
    _obscureText = value;
    notifyListeners();
  }
}