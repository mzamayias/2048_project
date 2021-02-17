import 'package:flutter/material.dart';
import 'base_button.dart';


class BackButton extends StatelessWidget {
  const BackButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      buttonText: 'Go back',
      onPressed: () => Navigator.pop(context),
    );
  }
}
