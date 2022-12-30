import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentThemeMode = ThemeMode.light;
  String currentLang = 'en';

  void changeTheme(ThemeMode themeMode){
    currentThemeMode = themeMode;
    notifyListeners();
  }

  void changeLoc(String newLac){
    currentLang = newLac;
    notifyListeners();
  }


}