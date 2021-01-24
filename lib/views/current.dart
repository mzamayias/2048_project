import 'package:flutter/material.dart';

import 'game/game.dart';
import 'options/options.dart';
import 'help/help.dart';

class CurrentView extends StatefulWidget {
  const CurrentView({Key key}) : super(key: key);
  @override
  _CurrentViewState createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
  int _selectedIndex = 0;

  static const List<Widget> _views = <Widget>[
    GameView(
      viewTitle: 'Game',
    ),
    OptionsView(
      viewTitle: 'Options',
    ),
    HelpView(
      viewTitle: 'Help',
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
        iconSize: 33,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: Colors.blueAccent[700],
          opacity: 1,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[50],
          opacity: 1,
        ),
        backgroundColor: Colors.blueGrey[200],
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: _views.elementAt(_selectedIndex),
    );
  }
}
