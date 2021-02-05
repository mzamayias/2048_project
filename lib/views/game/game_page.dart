// import packages
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

// import view components
import 'package:project_2048/views/components/base_button.dart'; // blue buttons
import 'package:project_2048/views/components/base_page.dart';
import 'package:project_2048/views/game/exit/layouts/exit_page_layout.dart'; // view blueprint

class GamePage extends StatelessWidget {
  const GamePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
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
              duration: Duration(milliseconds: 300),
              reverseDuration: Duration(milliseconds: 300),
              child: ExitPageLayout(),
            ),
          ),
        ),
      ],
    );
  }
}
