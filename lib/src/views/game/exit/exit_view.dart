// import dart packages
import 'dart:io';

// import flutter packages
import 'package:flutter/material.dart';

// import view widgets
import 'package:project_2048/src/views/widgets/base_view.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';
import 'package:project_2048/src/views/widgets/one_string_card.dart';

class ExitView extends StatelessWidget {
  const ExitView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: 'Exit',
      children: <Widget>[
        const OneStringCard(
          cardText: 'Are you sure you would like to exit the app?',
        ),
        const Spacer(
          flex: 32,
        ),
        BaseButton(
          buttonText: 'Yes',
          onPressed: () => exit(0),
        ),
        const Spacer(),
        BaseButton(
          buttonText: 'No',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
