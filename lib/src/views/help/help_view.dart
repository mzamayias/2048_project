import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:project_2048/src/views/help/about/about_view.dart';
import 'package:project_2048/src/views/components/base_view.dart';
import 'package:project_2048/src/views/components/base_button.dart';

class HelpView extends StatelessWidget {
  const HelpView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: 'Help',
      children: <Widget>[
        BaseButton(
          buttonText: 'About',
          onPressed: () => Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              curve: Curves.easeInToLinear,
              duration: Duration(milliseconds: 210),
              reverseDuration: Duration(milliseconds: 210),
              child: AboutView(),
            ),
          ),
        )
      ],
    );
  }
}
