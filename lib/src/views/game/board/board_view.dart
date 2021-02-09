import 'package:flutter/material.dart';
import 'package:project_2048/src/views/game/twenty_forty_eight/twenty_forty_eight.dart';
import 'package:project_2048/src/views/widgets/base_view.dart';
import 'package:project_2048/src/views/widgets/base_button.dart';
import 'package:project_2048/src/views/widgets/two_string_card.dart';

class BoardView extends StatelessWidget {
  const BoardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: '2048',
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: BaseButton(
                buttonText: 'Restart',
              ),
            ),
            Expanded(
              child: BaseButton(
                buttonText: 'Redo',
              ),
            ),
          ],
        ),
        TwentyFourtyEight(),
        TwoStringCard(
          dataType: 'Score',
          dataValue: '${10676}',
        ),
        BaseButton(
          buttonText: 'Go back',
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
