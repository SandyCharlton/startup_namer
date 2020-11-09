import 'package:flutter/material.dart';
import 'package:startup_namer/theme_changer.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this contains all the code for our settings page


// Creates the settings page
class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkModeBool = false;
  bool isSandyRad = false;

  // These are the bools for metrics
  bool isSpeedOn = true;
  bool isSpeedAvgOn = true;
  bool isDistanceOn = true;
  bool isTimeOn = true;
  bool isStrokeRateOn = true;
  bool isStrokeRateAvgOn = true;

  @override
  void initState() {
    super.initState();
    getSwitchValues();
  }

  getSwitchValues() async {
    isDarkModeBool = await getSwitchState();
    setState(() {

    });
  }

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
                      children: [
                        Text ('DarkMode', style: TextStyle(fontSize: (20))),
                        Switch(
                          value: isDarkModeBool,
                          onChanged: (value) {
                            ThemeBuilder.of(context).changeTheme();
                            setState(() {
                              isDarkModeBool = value;
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        )
                      ],
                    ),
                    Row( // This row asks if Sandy is Rad? At the time, it was a test to learn how to add a second button
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text ('Is Sandy Rad?', style: TextStyle(fontSize: (20))),
                        Switch(
                          value: isSandyRad,
                          onChanged: (value) {
                            setState(() {
                              isSandyRad = value;
                              print(isSandyRad);
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        )
                      ]
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
                        children:[
                          Text ('Show Speed?', style: TextStyle(fontSize: (20))),
                          Checkbox(
                            value: isSpeedOn,
                            onChanged: (value) {
                              setState(() {
                                isSpeedOn = value;
                                print(isSpeedOn);
                              });
                            },
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text ('Show Average Speed?', style: TextStyle(fontSize: (20))),
                          Checkbox(
                            value: isSpeedAvgOn,
                            onChanged: (value) {
                              setState(() {
                                isSpeedAvgOn = value;
                                print(isSpeedAvgOn);
                              });
                            },
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text ('Show Distance?', style: TextStyle(fontSize: (20))),
                          Checkbox(
                            value: isDistanceOn,
                            onChanged: (value) {
                              setState(() {
                                isDistanceOn = value;
                                print(isDistanceOn);
                              });
                            },
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text ('Show Time?', style: TextStyle(fontSize: (20))),
                          Checkbox(
                            value: isTimeOn,
                            onChanged: (value) {
                              setState(() {
                                isTimeOn = value;
                                print(isTimeOn);
                              });
                            },
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text ('Show Stroke Rate?', style: TextStyle(fontSize: (20))),
                          Checkbox(
                            value: isStrokeRateOn,
                            onChanged: (value) {
                              setState(() {
                                isStrokeRateOn = value;
                                print(isStrokeRateOn);
                              });
                            },
                          )
                        ]
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Text ('Show Average Stroke Rate?', style: TextStyle(fontSize: (20))),
                          Checkbox(
                            value: isStrokeRateAvgOn,
                            onChanged: (value) {
                              setState(() {
                                isStrokeRateAvgOn = value;
                                print(isStrokeRateAvgOn);
                              });
                            },
                          )
                        ]
                    ),
                  ],
                )
            )
        )
    );
  }
}
