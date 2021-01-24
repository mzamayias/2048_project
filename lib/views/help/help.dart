import 'package:flutter/material.dart';

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
          onPressed: () => Card(
            color: Colors.amber,
            child: Text('data'),
          ),
        ),
      ],
    );
  }
}
