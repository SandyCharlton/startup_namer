import 'package:flutter/material.dart';
import 'package:startup_namer/settings_page.dart';
import 'package:startup_namer/theme_changer.dart';


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
