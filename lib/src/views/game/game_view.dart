// import packages
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'playing_area/playing_area_view.dart';
// import view widgets
import '../widgets/base_view.dart';
import '../widgets/base_button.dart';
import 'exit/exit_view.dart';

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
