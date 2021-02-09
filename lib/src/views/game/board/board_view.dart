import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/base_view.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';
import 'package:project_2048/src/views/widgets/two_string_container.dart';

class BoardView extends StatelessWidget {
  const BoardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: '2048',
      children: [
        TwoStringContainer(
          dataType: 'Score',
          dataValue: '${10676}',
        ),
        BaseButton(
          buttonText: 'Redo',
        ),
        BaseButton(
          buttonText: 'Restart',
        ),
        BaseButton(
          buttonText: 'Go back',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
