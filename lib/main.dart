import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'views/game.dart';
import 'views/options.dart';
import 'views/help.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const TextStyle _optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgets = <Widget>[
    GameView(
      widgetText: Text(
        'Game View',
        style: _optionStyle,
      ),
    ),
    OptionsView(
      widgetText: Text(
        'Options View',
        style: _optionStyle,
      ),
    ),
    HelpView(
      widgetText: Text(
        'Help View',
        style: _optionStyle,
      ),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double padding = 20.0;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.grey[200],
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.grey[200],
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.games_rounded),
                label: 'Game',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded),
                label: 'Options',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.help_rounded),
                label: 'Help',
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey[500],
            onTap: _onItemTapped,
          ),
          body: SafeArea(
            child: Center(
              child: _widgets.elementAt(
                _selectedIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
