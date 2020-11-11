import 'package:flutter/material.dart';
import 'package:theme_switcher/view/settings_page.dart';
import 'package:theme_switcher/services/theme_changer.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Provider',
      theme: light,
      home: SettingsPage(),
    );
  }
}
