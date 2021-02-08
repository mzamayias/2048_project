import 'package:flutter/material.dart';

import 'package:project_2048/src/views/components/base_button.dart';
import 'package:project_2048/src/views/components/base_view.dart';

class OptionsView extends StatelessWidget {
  const OptionsView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: 'Options',
      children: <Widget>[
        BaseButton(
          buttonText: 'Show Move History',
        ),
      ],
    );
  }
}
