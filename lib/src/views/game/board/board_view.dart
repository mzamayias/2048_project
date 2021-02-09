import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/base_view.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';
import 'package:project_2048/src/views/widgets/one_string_card.dart';
import 'package:project_2048/src/views/widgets/two_string_card.dart';

class BoardView extends StatelessWidget {
  const BoardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: '2048',
      children: [
        TwoStringCard(
          dataType: 'Score',
          dataValue: '${2048}',
        ),
        BaseButton(
          buttonText: 'Go back',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
