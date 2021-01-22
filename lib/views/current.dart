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

  static const List<Widget> _widgets = <Widget>[
    GameView(
      string: 'Game View',
    ),
    OptionsView(
      string: 'Options View',
    ),
    HelpView(
      string: 'Help View',
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
        iconSize: 32,
        backgroundColor: Colors.blueAccent[400],
        selectedItemColor: Colors.grey[200],
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      body: Center(
        child: _widgets.elementAt(
          _selectedIndex,
        ),
      ),
    );
  }
}
