import 'package:flutter/material.dart';

import 'blueprint.dart';

class PlayingGroundView extends StatelessWidget {
  const PlayingGroundView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlueprintView(
      text: "Playing\nGround",
      textColor: Colors.grey[850],
      fontSize: 48,
      backgroundColor: Colors.blue,
    );
  }
}
