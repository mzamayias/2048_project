import 'dart:io';

import 'package:flutter/material.dart';

import 'package:project_2048/views/components/base_button.dart';
import 'package:project_2048/views/components/base_view.dart';

class GameView extends StatelessWidget {
  const GameView({
    Key key,
    this.viewTitle,
  }) : super(key: key);

  final String viewTitle;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: viewTitle,
      children: <Widget>[
        BaseButton(
          buttonText: 'New game',
        ),
        BaseButton(
          buttonText: 'Restart game',
        ),
        BaseButton(
          buttonText: 'Exit',
          // onPressed: () => exit(0),
        ),
      ],
    );
  }
}
