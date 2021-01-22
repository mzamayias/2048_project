import 'package:flutter/material.dart';
import 'package:project_2048/custom_buttons/custom_button.dart';

import 'blueprint.dart';

class GameView extends StatelessWidget {
  const GameView({
    Key key,
    this.string,
  }) : super(key: key);

  final String string;

  @override
  Widget build(BuildContext context) {
    return BlueprintView(
      string: string,
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: GridView.count(
          crossAxisCount: 3,
          scrollDirection: Axis.horizontal,
          crossAxisSpacing: 20.0,
          physics: NeverScrollableScrollPhysics(),
          mainAxisSpacing: 20.0,
          children: <Widget>[
            CustomButton(
              string: 'New Game',
            ),
            CustomButton(
              string: 'Restart',
            ),
            CustomButton(
              string: 'Exit',
            ),
          ],
        ),
      ),
    );
  }
}
