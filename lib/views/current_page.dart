// import flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import pages
import 'package:project_2048/views/game/game_page.dart';
import 'package:project_2048/views/help/help_page.dart';
import 'package:project_2048/views/options/options_page.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({Key key}) : super(key: key);
  @override
  _CurrentPageState createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  static List<Widget> _pages = [
    GamePage(),
    OptionsPage(),
    HelpPage(),
  ];

  // https://stackoverflow.com/a/63258130/13504709
  int _pageIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: PageView(
        children: _pages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onIconTapped,
        backgroundColor: Colors.grey[50],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(
          color: Colors.blueAccent[700],
          size: 36,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.blueAccent[700],
          size: 36,
        ),
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
            icon: Icon(Icons.help_outline_outlined),
            activeIcon: Icon(Icons.help_rounded),
            label: 'Help',
          ),
        ],
      ),
    );
  }

  void onPageChanged(int pageIndex) {
    setState(() {
      this._pageIndex = pageIndex;
    });
  }

  void onIconTapped(int pageIndex) {
    this._pageController.animateToPage(
          pageIndex,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInToLinear,
        );
  }
}
