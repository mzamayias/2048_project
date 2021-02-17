// import flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import pages
import 'game/game_view.dart';
import 'help/help_view.dart';
import 'options/options_view.dart';

class CurrentView extends StatefulWidget {
  const CurrentView({Key key}) : super(key: key);
  @override
  _CurrentViewState createState() => _CurrentViewState();
}

class _CurrentViewState extends State<CurrentView> {
  static final List<Widget> _pages = [
    const GameView(),
    const OptionsView(),
    const HelpView(),
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
    final IconThemeData _iconThemeData = IconThemeData(
      color: Colors.blueAccent[700],
      size: 33,
    );
    const TextStyle _labelTextStyle = TextStyle(
      fontSize: 21,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: PageView(
        onPageChanged: onPageChanged,
        controller: _pageController,
        children: _pages,
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
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedLabelStyle: _labelTextStyle,
            selectedItemColor: Colors.blueAccent[700],
            unselectedItemColor: Colors.blueAccent[700],
            unselectedLabelStyle: _labelTextStyle,
            selectedIconTheme: _iconThemeData,
            unselectedIconTheme: _iconThemeData,
            items: const <BottomNavigationBarItem>[
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
      _pageIndex = pageIndex;
    });
  }

  void onIconTapped(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInToLinear,
    );
  }
}
