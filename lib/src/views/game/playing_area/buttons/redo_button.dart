import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';

class RedoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: BaseButton(
        buttonText: 'Redo',
      ),
    );
  }
}