import 'package:flutter/material.dart';
import '../../../widgets/base_button.dart';

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