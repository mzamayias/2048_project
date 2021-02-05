import 'package:flutter/material.dart';

import 'package:project_2048/views/components/base_button.dart';
import 'package:project_2048/views/components/base_page.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePage(
      viewTitle: 'Options',
      children: <Widget>[
        BaseButton(
          buttonText: 'Show Move History',
        ),
      ],
    );
  }
}
