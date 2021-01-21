import 'package:flutter/material.dart';

class BlueprintView extends StatelessWidget {
  const BlueprintView({
    Key key,
    this.widgetText,
  }) : super(key: key);

  final Text widgetText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: widgetText,
      ),
    );
  }
}
