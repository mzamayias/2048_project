import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';

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
