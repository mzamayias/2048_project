// import packages
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_2048/src/views/game/playing_area/playing_area_view.dart';
// import view widgets
import 'package:project_2048/src/views/widgets/base_view.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';
import 'package:project_2048/src/views/game/exit/exit_view.dart';

class GameView extends StatelessWidget {
  const GameView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PlayingAreaView playingAreaView = PlayingAreaView();
    const ExitView exitView = ExitView();
    return BaseView(
      viewTitle: 'Game',
      children: <Widget>[
        BaseButton(
          buttonText: 'New game',
          onPressed: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              curve: Curves.easeInToLinear,
              duration: const Duration(milliseconds: 210),
              reverseDuration: const Duration(milliseconds: 210),
              child: playingAreaView,
            ),
          ),
        ),
        BaseButton(
          buttonText: 'Continue game',
          onPressed: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              curve: Curves.easeInToLinear,
              duration: const Duration(milliseconds: 210),
              reverseDuration: const Duration(milliseconds: 210),
              child: playingAreaView,
            ),
          ),
        ),
        BaseButton(
          buttonText: 'Exit',
          onPressed: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              curve: Curves.easeInToLinear,
              duration: const Duration(milliseconds: 210),
              reverseDuration: const Duration(milliseconds: 210),
              child: exitView,
            ),
          ),
        ),
      ],
    );
  }
}
