import 'package:flutter/material.dart' hide BackButton;
import 'package:project_2048/src/views/game/playing_area/buttons/redo_button.dart';
import 'package:project_2048/src/views/game/playing_area/buttons/restart_button.dart';
import 'package:project_2048/src/views/game/playing_area/game_board/game_board_view.dart';
// import 'package:project_2048/src/views/game/playing_area/game_board/game_board_view.dart';
import 'package:project_2048/src/views/game/playing_area/score_board/score_board_view.dart';
import 'package:project_2048/src/views/widgets/back_button.dart';
import 'package:project_2048/src/views/widgets/base_view.dart';

class PlayingAreaView extends StatelessWidget {
  const PlayingAreaView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewTitle: '2048',
      children: [
        RestartButton(),
        RedoButton(),
        GameBoardView(),
        ScoreBoard(),
        BackButton(),
      ],
    );
  }
}
