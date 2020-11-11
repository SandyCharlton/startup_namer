import 'package:flutter/material.dart';

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
