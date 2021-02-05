// import dart packages
import 'dart:io';

// import flutter packages
import 'package:flutter/material.dart';

// import view components
import 'package:project_2048/views/components/base_page.dart';
import 'package:project_2048/views/components/base_button.dart';
import 'package:project_2048/views/components/base_card.dart';

class ExitPageLayout extends StatelessWidget {
  const ExitPageLayout({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      viewTitle: 'Exit',
      children: <Widget>[
        BaseCard(
          cardText: 'Are you sure you would like to exit the app?',
        ),
        Spacer(
          flex: 30,
        ),
        BaseButton(
          buttonText: 'Yes',
          onPressed: () => exit(0)
        ),
        Spacer(
          flex: 1,
        ),
        BaseButton(
          buttonText: 'No',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
