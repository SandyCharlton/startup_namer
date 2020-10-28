import 'package:flutter/material.dart';

// this class will be used to switch themes at the push of a button.
// taken from https://www.youtube.com/watch?v=WMvjL6AN9dY

// most of this stuff is setup automatically when creating a Stateful Widget
class ThemeBuilder extends StatefulWidget {
  final Widget Function(BuildContext context, Brightness brightness) builder;
  ThemeBuilder({this.builder});
  @override
  _ThemeBuilderState createState() => _ThemeBuilderState();
  static _ThemeBuilderState of (BuildContext context)
  {
    return context.ancestorStateOfType(const TypeMatcher<_ThemeBuilderState>()); // this method is depreciated.
    // TODO: There's probably a better way to do this, but for now, this works.
  }
}

class _ThemeBuilderState extends State<ThemeBuilder> {
  Brightness _brightness;

  @override
  // The initial state of the app. Currently it's set to light, but you can change that
  void initState() {
    super.initState();
    _brightness = Brightness.light;
  }

  void changeTheme() {
    setState(() {
      _brightness =
          _brightness == Brightness.dark ? Brightness.light : Brightness.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _brightness);
  }
}
