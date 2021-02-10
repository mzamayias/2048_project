import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';

class RestartButton extends StatelessWidget {
  final Function onPressed;

  const RestartButton({
    Key key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseButton(
        buttonText: 'Restart',
        onPressed: onPressed,
      ),
    );
  }
}
