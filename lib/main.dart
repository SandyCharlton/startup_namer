// Copyright 2018 the Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found  in the LICENSE file.abstract

// Sandy Charlton is using this code as his first foray into Flutter

// TODO: Settings do not change, let's fix that.

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startup_namer/theme_changer.dart';
import 'package:startup_namer/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SettingNotifier(),
        child: Consumer<SettingNotifier>(
          builder: (context, SettingNotifier notifier, child) {
            return MaterialApp(
            title: 'Startup Name Generator',
            theme: notifier.darkTheme ? dark : light,
            home: RandomWords(),
            );
          }, // builder
        ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions =
      <WordPair>[]; // this is used to save the suggested pairings
  // final _saved = Set<WordPair>();
  final _biggerFont = TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Startup Name Generator'), actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // go to settings page
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsPage()));
            })
      ]),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          // this a (infinite) list of items,
          if (i.isOdd) return Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            generateWordPairs(safeOnly: false);
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // This badboy right here is
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
