import 'package:flutter/material.dart';

import 'blueprint.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlueprintView(
      text: "Home",
      textColor: Colors.grey[200],
      fontSize: 48,
      backgroundColor: Colors.pink[700],
    );
  }
}
