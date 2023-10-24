import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Locale get locale => _locale;
  void setLanguage(local) {
    _locale = local;
    notifyListeners();
  }
}
