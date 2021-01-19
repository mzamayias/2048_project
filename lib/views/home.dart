import 'package:flutter/material.dart';

import 'blueprint.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlueprintView(
      text: "Home",
      textColor: Colors.white,
      fontSize: 48,
      backgroundColor: Colors.pink[900],
    );
  }
}
