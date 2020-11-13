import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/theme_changer.dart';

// this contains all the code for our settings page

// Creates the settings page
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  // These are the bools for metrics
  bool isSpeedOn = true;
  bool isSpeedAvgOn = true;
  bool isDistanceOn = true;
  bool isTimeOn = true;
  bool isStrokeRateOn = true;
  bool isStrokeRateAvgOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        // TODO: Change the location of the button to be in a list.
        body: Align(
            alignment: Alignment.topLeft, // starts this whole container in the top left corner
            child: Container(
                padding: EdgeInsets.all(20),
                child: Column( // This container holds the entire screen. All the rows, all the buttons, everything
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row( // This row is for dark mode selection
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text ('Is Dark Mode?', style: TextStyle(fontSize: (20))),
                        Consumer<SettingNotifier>(
                          builder: (context, notifier, child) =>
                              Switch(
                                onChanged: (value){
                                  notifier.toggleTheme();
                                  },
                                value: notifier.darkTheme,
                              ),
                        ),
                      ],
                    ),
                    Row( // This row asks if Sandy is Rad? At the time, it was a test to learn how to add a second button
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text ('Is Sandy Rad?', style: TextStyle(fontSize: (20))),
                        Consumer<SettingNotifier>(
                          builder: (context, notifier, child) =>
                              Switch(
                                onChanged: (value){
                                  notifier.toggleIsSandyRad();
                                  },
                                value: notifier.isSandyRad,
                              ),
                        ),
                      ],
                    ),
                    Divider( // divides the app with a thin blue line
                      thickness: 1,
                      color: Colors.blueAccent,
                    ),
                    SizedBox( // this sized box is used to take up space, nothing more
                      height: 10,
                    ),
                    Text( // a small piece of text that
                      'Paddler Modules', style: TextStyle(fontSize: (14), color: Colors.blue)
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text ('Show Speed?', style: TextStyle(fontSize: (20))),
                          Consumer<SettingNotifier>(
                            builder: (context, notifier, child) =>
                              Checkbox(
                                onChanged: (value) {
                                  notifier.toggleIsSpeedOn();
                                  },
                                  value: notifier.isSpeedOn,
                                  ),
                              ),
                        ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text ('Show Average Speed?', style: TextStyle(fontSize: (20))),
                          Consumer<SettingNotifier>(
                            builder: (context, notifier, child) =>
                                Checkbox(
                                  onChanged: (value) {
                                    notifier.toggleIsSpeedAvgOn();
                                  },
                                  value: notifier.isSpeedAvgOn,
                                ),
                          ),
                          ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text ('Show Distance?', style: TextStyle(fontSize: (20))),
                          Consumer<SettingNotifier>(
                            builder: (context, notifier, child) =>
                                Checkbox(
                                  onChanged: (value) {
                                    notifier.toggleIsDistanceOn();
                                  },
                                  value: notifier.isDistanceOn,
                                ),
                          ),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text ('Show Time?', style: TextStyle(fontSize: (20))),
                          Consumer<SettingNotifier>(
                            builder: (context, notifier, child) =>
                                Checkbox(
                                  onChanged: (value) {
                                    notifier.toggleIsTimeOn();
                                  },
                                  value: notifier.isTimeOn,
                                ),
                          ),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text ('Show Stroke Rate?', style: TextStyle(fontSize: (20))),
                          Consumer<SettingNotifier>(
                            builder: (context, notifier, child) =>
                                Checkbox(
                                  onChanged: (value) {
                                    notifier.toggleIsStrokeRateOn();
                                  },
                                  value: notifier.isStrokeRateOn,
                                ),
                          ),
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:<Widget>[
                          Text ('Show Average Stroke Rate?', style: TextStyle(fontSize: (20))),
                          Consumer<SettingNotifier>(
                            builder: (context, notifier, child) =>
                                Checkbox(
                                  onChanged: (value) {
                                    notifier.toggleIsStrokeRateAvgOn();
                                  },
                                  value: notifier.isStrokeRateAvgOn,
                                ),
                          ),
                        ]
                    ),
                  ]
                )
            )
        )
    );
  }
}
