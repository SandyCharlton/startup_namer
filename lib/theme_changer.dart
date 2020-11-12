import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this class will be used to switch themes at the push of a button.
// taken from https://www.youtube.com/watch?v=WMvjL6AN9dY

// Revised completely on November 10th, 2020
// https://codesource.io/building-theme-switcher-using-provider-and-shared-preferences/

ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    accentColor: Colors.pink,
    scaffoldBackgroundColor: Color(0xfff1f1f1)
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);

class ThemeNotifier extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _pref;
  bool _darkTheme;
  bool get darkTheme => _darkTheme;
  ThemeNotifier() {
    _darkTheme = true;
  }
  toggleTheme() {
    _darkTheme = !_darkTheme;
    notifyListeners();
  }

}