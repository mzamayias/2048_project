import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:project_2048/views/help/about/about_page.dart';
import 'package:project_2048/views/components/base_page.dart';
import 'package:project_2048/views/components/base_button.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
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
              child: AboutPage(),
            ),
          ),
        )
      ],
    );
  }
}
