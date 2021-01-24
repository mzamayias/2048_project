import 'package:flutter/material.dart';

import '../../custom_widgets/custom_button.dart';
import '../blueprint.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({
    Key key,
    this.viewTitle,
  }) : super(key: key);

  final String viewTitle;

  @override
  Widget build(BuildContext context) {
    return BlueprintView(
      viewTitle: viewTitle,
      children: <Widget>[
        CustomButton(
          buttonText: 'History',
        )
      ],
    );
  }
}
