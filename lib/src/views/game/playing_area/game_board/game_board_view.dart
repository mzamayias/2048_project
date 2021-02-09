import 'dart:ui';

import 'package:flutter/material.dart';

class GameBoardView extends StatelessWidget {
  const GameBoardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      color: Colors.cyan[700],
      shadowColor: Colors.grey[850],
      elevation: 3,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(21),
        ),
      ),
    );
  }
}
