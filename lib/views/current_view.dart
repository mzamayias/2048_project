import 'package:bubbled_navigation_bar/bubbled_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_2048/views/components/bubbled_navigation_bar_item.dart';

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
  static List<Widget> _views = [
    GameView(),
    OptionsView(),
    HelpView(),
  ];

  PageController _pageController;
  MenuPositionController _menuPositionController;
  bool _userPageDragging = false;

  @override
  void initState() {
    _menuPositionController = MenuPositionController(
      initPosition: 0,
    );

    _pageController = PageController(
      initialPage: 0,
      keepPage: false,
      viewportFraction: 1.0,
    );

    _pageController.addListener(
      handlePageChange,
    );

    super.initState();
  }

  void handlePageChange() {
    _menuPositionController.absolutePosition = _pageController.page;
  }

  // ignore: missing_return
  bool checkUserDragging(ScrollNotification scrollNotification) {
    if (scrollNotification is UserScrollNotification &&
        scrollNotification.direction != ScrollDirection.idle) {
      _userPageDragging = true;
    } else if (scrollNotification is ScrollEndNotification) {
      _userPageDragging = false;
    }
    if (_userPageDragging) {
      _menuPositionController.findNearestTarget(_pageController.page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) =>
            checkUserDragging(scrollNotification),
        child: PageView(
          physics: BouncingScrollPhysics(),
          controller: _pageController,
          children: _views,
        ),
      ),
      bottomNavigationBar: BubbledNavigationBar(
        controller: _menuPositionController,
        onTap: (index) => _pageController.animateToPage(
          index,
          curve: Curves.easeInOutQuad,
          duration: Duration(milliseconds: 500),
        ),
        itemMargin: EdgeInsets.symmetric(horizontal: 18.0),
        defaultBubbleColor: Colors.blueAccent[700],
        backgroundColor: Colors.grey[50],
        items: <BubbledNavigationBarItem>[
          bubbledNavigationBarItem(
            Icons.gamepad_outlined,
            Icons.gamepad_rounded,
            'Game',
          ),
          bubbledNavigationBarItem(
            Icons.settings_outlined,
            Icons.settings_rounded,
            'Options',
          ),
          bubbledNavigationBarItem(
            Icons.help_outline_outlined,
            Icons.help_rounded,
            'Help',
          ),
        ],
      ),
    );
  }
}
