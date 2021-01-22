import 'package:flutter/material.dart';

import 'game.dart';
import 'options.dart';
import 'help.dart';

class CurrentView extends StatefulWidget {
  const CurrentView({Key key}) : super(key: key);
  @override
  _CurrentViewState createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
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
    return Scaffold(
      backgroundColor: Colors.grey[200],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.gamepad_outlined),
            activeIcon: Icon(Icons.gamepad_rounded),
            label: 'Game',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings_rounded),
            label: 'Options',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline_rounded),
            activeIcon: Icon(Icons.help_rounded),
            label: 'Help',
          )
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        iconSize: 32,
        selectedItemColor: Colors.blueAccent[400],
        unselectedItemColor: Colors.grey[500],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: SafeArea(
        child: Center(
          child: _widgets.elementAt(
            _selectedIndex,
          ),
        ),
      ),
    );
  }
}
