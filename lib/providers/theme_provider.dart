import 'package:flutter/material.dart';

import '../theming/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _mode = AppTheme.dartMode;
  ThemeData get mode => _mode;
  void setTheme(mod) {
    _mode = mod;
    notifyListeners();
  }
}
