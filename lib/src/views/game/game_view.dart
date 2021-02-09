// import packages
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
    return BaseView(
      viewTitle: 'Game',
      children: <Widget>[
        Spacer(flex: 31),
        BaseButton(buttonText: 'New game'),
        Spacer(flex: 1),
        BaseButton(buttonText: 'Continue game'),
        Spacer(flex: 1),
        BaseButton(
          buttonText: 'Exit',
          onPressed: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              curve: Curves.easeInToLinear,
              duration: Duration(milliseconds: 210),
              reverseDuration: Duration(milliseconds: 210),
              child: ExitViewLayout(),
            ),
          ),
        ),
      ],
    );
  }
}