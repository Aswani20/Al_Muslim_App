import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  // Put Data Change Allover The App
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.dark;

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }

  void changeTheme(ThemeMode newTheme) {
    if (appTheme == newTheme) {
      return;
    }
    appTheme = newTheme;
    notifyListeners();
  }
}
