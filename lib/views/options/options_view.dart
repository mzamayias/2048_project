import 'package:flutter/material.dart';

import 'package:project_2048/views/components/base_button.dart';
import 'package:project_2048/views/components/base_view.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({
    Key key,
    this.viewTitle,
  }) : super(key: key);

  final String viewTitle;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: viewTitle,
      children: <Widget>[
        BaseButton(
          buttonText: 'History',
        )
      ],
    );
  }
}
