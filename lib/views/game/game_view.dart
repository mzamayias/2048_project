// import packages
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_2048/controllers/game/exit/exit_app.dart';

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
        BaseButton(
          buttonText: 'New game',
        ),
        SizedBox(
          height: 18,
        ),
        BaseButton(
          buttonText: 'Continue game',
        ),
        SizedBox(
          height: 18,
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
