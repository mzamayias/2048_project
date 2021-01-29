import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:page_transition/page_transition.dart';

import 'package:project_2048/views/help/about/about_view.dart';
import 'package:project_2048/views/components/base_view.dart';
import 'package:project_2048/views/components/base_button.dart';

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
              type: PageTransitionType.rightToLeftWithFade,
              curve: Curves.elasticInOut,
              duration: Duration(milliseconds: 600),
              reverseDuration: Duration(milliseconds: 600),
              child: AboutView(),
            ),
          ),
        )
      ],
    );
  }
}
