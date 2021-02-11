import 'package:flutter/material.dart';
import 'package:project_2048/src/models/game/playing_area/game_board/score_model.dart';
import 'package:project_2048/src/views/widgets/two_string_card.dart';
import 'package:provider/provider.dart';

class ScoreView extends StatelessWidget {
  const ScoreView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScoreModel scoreModel = Provider.of<ScoreModel>(context);
    return TwoStringCard(
      dataType: 'Score',
      dataValue: '${scoreModel.score}',
    );
  }
}
