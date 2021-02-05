// import dart packages
import 'dart:io';

// import flutter packages
import 'package:flutter/material.dart';

// import view components
import 'package:project_2048/views/components/base_view.dart';
import 'package:project_2048/views/components/base_button.dart';
import 'package:project_2048/views/components/base_card.dart';

class ExitViewLayout extends StatelessWidget {
  const ExitViewLayout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: 'Exit',
      children: <Widget>[
        BaseCard(
          cardText: 'Are you sure you would like to exit the app?',
        ),
        Spacer(
          flex: 1,
        ),
        BaseButton(
          buttonText: 'Yes',
          onPressed: () => exit(0)
        ),
        Spacer(
          flex: 1,
        ),
        BaseButton(
          buttonText: 'Go back',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}