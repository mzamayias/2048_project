import 'dart:ui';

import 'package:flutter/material.dart';

class PlayingAreaView extends StatelessWidget {
  const PlayingAreaView({Key key}) : super(key: key);

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
          padding: EdgeInsets.all(21)
        ),
      ),
    );
  }
}
