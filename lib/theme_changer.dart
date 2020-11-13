import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Theme data for the light mode. We can change these colors at a later date
ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    accentColor: Colors.pink,
    scaffoldBackgroundColor: Color(0xfff1f1f1));

// Theme data for the dark mode. We can change these colors at a later date
ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.indigo,
  accentColor: Colors.pink,
);

class SettingNotifier extends ChangeNotifier {
  // key strings for setting the preferences.
  final String stringDarkMode = "theme";
  final String stringIsSandyRad = "rad";
  final String stringIsSpeedOn = "speed";
  final String stringIsSpeedAvgOn = "speedAvg";
  final String stringIsDistanceOn = "distance";
  final String stringIsTimeOn = "time";
  final String stringIsStrokeRateOn = "strokeRate";
  final String stringIsStrokeRateAvgOn = "strokeRateAvg";

  // where the preferences are stored
  SharedPreferences _pref;

  // bools for switches
  bool _darkTheme;
  bool get darkTheme => _darkTheme;
  bool _isSandyRad;
  bool get isSandyRad => _isSandyRad;

  // bools for checkboxes
  bool _isSpeedOn;
  bool get isSpeedOn => _isSpeedOn;
  bool _isSpeedAvgOn;
  bool get isSpeedAvgOn => _isSpeedAvgOn;
  bool _isDistanceOn;
  bool get isDistanceOn => _isDistanceOn;
  bool _isTimeOn;
  bool get isTimeOn => _isTimeOn;
  bool _isStrokeRateOn;
  bool get isStrokeRateOn => _isStrokeRateOn;
  bool _isStrokeRateAvgOn;
  bool get isStrokeRateAvgOn => _isStrokeRateAvgOn;


  SettingNotifier() {
    _darkTheme = true;
    _isSandyRad = true;
    _isSpeedOn = true;
    _isSpeedAvgOn = true;
    _isDistanceOn = true;
    _isTimeOn = true;
    _isStrokeRateOn = true;
    _isStrokeRateAvgOn = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  toggleIsSandyRad() {
    _isSandyRad = !_isSandyRad;
    _saveToPrefs();
    notifyListeners();
  }

  toggleIsSpeedOn() {
    _isSpeedOn = !_isSpeedOn;
    _saveToPrefs();
    notifyListeners();
  }

  toggleIsSpeedAvgOn() {
    _isSpeedAvgOn = !_isSpeedAvgOn;
    _saveToPrefs();
    notifyListeners();
  }

  toggleIsDistanceOn() {
    _isDistanceOn = !_isDistanceOn;
    _saveToPrefs();
    notifyListeners();
  }

  toggleIsTimeOn() {
    _isTimeOn = !_isTimeOn;
    _saveToPrefs();
    notifyListeners();
  }

  toggleIsStrokeRateOn() {
    _isStrokeRateOn = !_isStrokeRateOn;
    _saveToPrefs();
    notifyListeners();
  }

  toggleIsStrokeRateAvgOn() {
    _isStrokeRateAvgOn = !_isStrokeRateAvgOn;
    _saveToPrefs();
    notifyListeners();
  }

  // this function is to initialize the preference variable _pref
  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref.getBool(stringDarkMode) ?? true;
    _isSandyRad = _pref.getBool(stringIsSandyRad) ?? true;
    _isSpeedOn = _pref.getBool(stringIsSpeedOn) ?? true;
    _isSpeedAvgOn = _pref.getBool(stringIsSpeedAvgOn) ?? true;
    _isDistanceOn = _pref.getBool(stringIsDistanceOn) ?? true;
    _isTimeOn = _pref.getBool(stringIsTimeOn) ?? true;
    _isStrokeRateOn = _pref.getBool(stringIsStrokeRateOn) ?? true;
    _isStrokeRateAvgOn = _pref.getBool(stringIsStrokeRateAvgOn) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(stringDarkMode, _darkTheme);
    _pref.setBool(stringIsSandyRad, _isSandyRad);
    _pref.setBool(stringIsSpeedOn, _isSpeedOn);
    _pref.setBool(stringIsSpeedAvgOn, _isSpeedAvgOn);
    _pref.setBool(stringIsDistanceOn, _isDistanceOn);
    _pref.setBool(stringIsTimeOn, _isTimeOn);
    _pref.setBool(stringIsStrokeRateOn, _isStrokeRateOn);
    _pref.setBool(stringIsStrokeRateAvgOn, _isStrokeRateAvgOn);
  }
}
