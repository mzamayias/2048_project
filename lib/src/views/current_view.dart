// import flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import pages
import 'package:project_2048/src/views/game/game_view.dart';
import 'package:project_2048/src/views/help/help_view.dart';
import 'package:project_2048/src/views/options/options_view.dart';

class CurrentView extends StatefulWidget {
  const CurrentView({Key key}) : super(key: key);
  @override
  _CurrentViewState createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
  static List<Widget> _pages = [
    GameView(),
    OptionsView(),
    HelpView(),
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
      bottomNavigationBar: PhysicalModel(
        color: Colors.transparent,
        shadowColor: Colors.grey[850],
        elevation: 9,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey[850].withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1.2,
              ),
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _pageIndex,
            onTap: onIconTapped,
            backgroundColor: Colors.grey[50],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(
              color: Colors.blueAccent[700],
              size: 33,
            ),
            unselectedIconTheme: IconThemeData(
              color: Colors.blueAccent[700],
              size: 33,
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
        ),
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
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInToLinear,
        );
  }
}
