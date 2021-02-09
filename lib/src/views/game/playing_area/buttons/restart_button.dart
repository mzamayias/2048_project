import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';

class RestartButton extends StatelessWidget {
  const RestartButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseButton(
        buttonText: 'Restart',
      ),
    );
  }
}
