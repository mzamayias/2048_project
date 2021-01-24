import 'package:flutter/material.dart';
import 'package:project_2048/views/help/about.dart';

import '../../custom_widgets/custom_button.dart';
import '../blueprint.dart';

class HelpView extends StatelessWidget {
  const HelpView({
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
          buttonText: 'About',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => About()),
          ),
        ),
      ],
    );
  }
}
