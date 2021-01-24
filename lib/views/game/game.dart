import 'dart:io';

import 'package:flutter/material.dart';

import '../../custom_widgets/custom_button.dart';
import '../blueprint.dart';

class GameView extends StatelessWidget {
  const GameView({
    Key key,
    this.viewTitle,
  }) : super(key: key);

  final String viewTitle;

  @override
  Widget build(BuildContext context) {
    return BlueprintView(
      viewTitle: viewTitle,
      children: <Widget>[
        CustomButton(
          buttonText: 'New game',
        ),
        SizedBox(
          height: 20.0,
        ),
        CustomButton(
          buttonText: 'Restart game',
        ),
        SizedBox(
          height: 20.0,
        ),
        CustomButton(
          buttonText: 'Exit',
          // onPressed: () => Navigator.pop(context),
          onPressed: () => exit(0),
        ),
      ],
    );
  }
}
