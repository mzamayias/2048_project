// import packages
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// import view components
import 'package:project_2048/views/components/base_button.dart'; // blue buttons
import 'package:project_2048/views/components/base_view.dart';
import 'package:project_2048/views/game/exit/layouts/exit_layout.dart'; // view blueprint

class GameView extends StatelessWidget {
  const GameView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: 'Game',
      children: <Widget>[
        Spacer(
          flex: 29,
        ),
        BaseButton(
          buttonText: 'New game',
        ),
        Spacer(
          flex: 1,
        ),
        BaseButton(
          buttonText: 'Continue game',
        ),
        Spacer(
          flex: 1,
        ),
        BaseButton(
          buttonText: 'Exit',
          onPressed: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.leftToRightWithFade,
              curve: Curves.easeInToLinear,
              duration: Duration(milliseconds: 600),
              reverseDuration: Duration(milliseconds: 600),
              child: ExitViewLayout(),
            ),
          ),
        ),
      ],
    );
  }
}
