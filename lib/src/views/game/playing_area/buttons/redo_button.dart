import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';
class RedoButton extends StatelessWidget {
  const RedoButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BaseButton(
        buttonText: 'Redo',
      ),
    );
  }
}