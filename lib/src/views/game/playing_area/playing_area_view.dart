import 'package:flutter/material.dart' hide BackButton;
import 'package:project_2048/src/models/game/playing_area/game_board/score_model.dart';
import 'package:project_2048/src/views/game/playing_area/buttons/redo_button.dart';
import 'package:project_2048/src/views/game/playing_area/buttons/restart_button.dart';
import 'package:project_2048/src/views/game/playing_area/game_board/game_board_view.dart';
import 'package:project_2048/src/views/game/playing_area/score_board/score_view.dart';
import 'package:project_2048/src/views/widgets/back_button.dart';
import 'package:project_2048/src/views/widgets/base_view.dart';
import 'package:provider/provider.dart';

class PlayingAreaView extends StatefulWidget {
  @override
  _PlayingAreaViewState createState() => _PlayingAreaViewState();
}

class _PlayingAreaViewState extends State<PlayingAreaView> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ScoreModel>.value(value: ScoreModel()),
      ],
      child: BaseView(
        viewTitle: '2048',
        children: [
          RestartButton(),
          RedoButton(),
          GameBoardView(),
          const ScoreView(),
          const BackButton(),
        ],
      ),
    );
  }
}
