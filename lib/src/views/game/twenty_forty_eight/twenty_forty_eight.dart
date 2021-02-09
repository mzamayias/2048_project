import 'dart:ui';

import 'package:flutter/material.dart';

class TwentyFourtyEight extends StatelessWidget {
  const TwentyFourtyEight({Key key}) : super(key: key);

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
