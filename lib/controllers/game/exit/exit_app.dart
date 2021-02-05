import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_2048/views/game/exit/components/exit_button.dart';

Function exitApp(BuildContext context) {
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
  );
}
