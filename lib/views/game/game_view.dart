// import packages
// import 'dart:io'; // used for exit command
import 'dart:io';

import 'package:flutter/material.dart';

// import view components
import 'package:project_2048/views/components/base_button.dart'; // blue buttons
import 'package:project_2048/views/components/base_view.dart';
import 'package:project_2048/views/game/exit/exit_button.dart'; // view blueprint

class GameView extends StatelessWidget {
  const GameView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: 'Game',
      children: <Widget>[
        SizedBox(
          height: 18,
        ),
        BaseButton(
          buttonText: 'New game',
        ),
        SizedBox(
          height: 18,
        ),
        BaseButton(
          buttonText: 'Continue game',
        ),
        SizedBox(
          height: 18,
        ),
        BaseButton(
          buttonText: 'Exit',
          onPressed: () =>
              showDialog(
                barrierDismissible: true,
                barrierColor: Colors.grey[50],
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Are you sure you want to exit the app?',
                    style: TextStyle(
                      color: Colors.grey[850],
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  backgroundColor: Colors.grey[50],
                  titlePadding: EdgeInsets.all(0.0),
                  buttonPadding: EdgeInsets.all(21.0),
                  actions: <Widget>[
                    ExitButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      buttonText: 'No',
                    ),
                    ExitButton(
                      onPressed: () => exit(0),
                      // onPressed: () => Navigator.of(context).pop(false),
                      buttonText: 'Yes',
                    ),
                  ],
                ),
              ) ??
              false,
        ),
      ],
    );
  }
}
