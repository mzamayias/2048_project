import 'package:flutter/material.dart';

import 'blueprint.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({
    Key key,
    this.string,
  }) : super(key: key);

  final String string;

  @override
  Widget build(BuildContext context) {
    return BlueprintView(
      string: string,
    );
  }
}
