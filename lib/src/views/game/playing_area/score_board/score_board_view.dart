import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/two_string_card.dart';

class ScoreBoard extends StatefulWidget {
  const ScoreBoard({Key key}) : super(key: key);

  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  int score;

  @override
  Widget build(BuildContext context) {
    score = 10676;
    return TwoStringCard(
      dataType: 'Score',
      dataValue: '$score',
    );
  }
}
