import 'package:flutter/material.dart';
import '../../../widgets/base_button.dart';

class RestartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: BaseButton(
        buttonText: 'Restart',
      ),
    );
  }
}
