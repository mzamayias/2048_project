import 'package:flutter/material.dart';

import 'blueprint.dart';

class HelpView extends StatelessWidget {
  const HelpView({
    Key key,
    this.widgetText,
  }) : super(key: key);

  final Text widgetText;

  @override
  Widget build(BuildContext context) {
    return BlueprintView(
      widgetText: widgetText,
    );
  }
}
