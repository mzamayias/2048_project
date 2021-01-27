import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// import project views
import 'package:project_2048/views/game/game_view.dart';
import 'package:project_2048/views/help/help_view.dart';
import 'package:project_2048/views/options/options_view.dart';

class CurrentView extends StatefulWidget {
  const CurrentView({Key key}) : super(key: key);
  @override
  _CurrentViewState createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
  int _selectedIndex = 0;

  static List<Widget> _views = <Widget>[
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

  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.grey[50],
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          // color: Colors.grey[50],
          color: Colors.teal[600],
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.blueAccent[700],
          animationCurve: Curves.easeInOutCubic,
          animationDuration: Duration(milliseconds: 600),
          height: 72,
          index: _selectedIndex,
          onTap: _onItemTapped,
          items: <Widget>[
            Icon(
              Icons.gamepad_rounded,
              color: Colors.grey[50],
              size: 39,
            ),
            Icon(
              Icons.settings_rounded,
              color: Colors.grey[50],
              size: 39,
            ),
            Icon(
              Icons.help_rounded,
              color: Colors.grey[50],
              size: 39,
            ),
          ],
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   type: BottomNavigationBarType.fixed,
        //   elevation: 0,
        //   backgroundColor: Colors.blueAccent[700],
        //   onTap: _onItemTapped,
        //   currentIndex: _selectedIndex,
        //   showSelectedLabels: true,
        //   selectedLabelStyle: TextStyle(
        //     color: Colors.white
        //   ),
        //   showUnselectedLabels: false,
        //   selectedIconTheme: IconThemeData(
        //     color: Colors.grey[200],
        //     size: 30,
        //   ),
        //   unselectedIconTheme: IconThemeData(
        //     color: Colors.grey[200],
        //     size: 30,
        //   ),
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.gamepad_outlined),
        //       activeIcon: Icon(Icons.gamepad_rounded),
        //       label: 'Game',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.settings_outlined),
        //       activeIcon: Icon(Icons.settings_rounded),
        //       label: 'Options',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.help_outline_rounded),
        //       activeIcon: Icon(Icons.help_rounded),
        //       label: 'Help',
        //     )
        //   ],
        // ),
        body: _views.elementAt(_selectedIndex),
      ),
    );
  }
}
