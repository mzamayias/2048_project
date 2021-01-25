import 'package:flutter/material.dart';

import 'package:project_2048/views/game/game_view.dart';
import 'package:project_2048/views/options/options_view.dart';
import 'package:project_2048/views/help/help_view.dart';

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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: Colors.grey[850],
          size: 30
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey[850],
          size: 30
        ),
      ),
      body: _views.elementAt(_selectedIndex),
    );
  }
}
