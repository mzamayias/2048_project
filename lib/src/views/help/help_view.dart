import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'about/about_view.dart';
import '../widgets/base_view.dart';
import '../widgets/base_button.dart';

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
              duration: const Duration(milliseconds: 210),
              reverseDuration: const Duration(milliseconds: 210),
              child: AboutView(),
            ),
          ),
        )
      ],
    );
  }
}
