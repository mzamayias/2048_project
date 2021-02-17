import 'package:flutter/material.dart' hide BackButton;
import '../../../models/game/playing_area/game_board/score_model.dart';
import 'buttons/redo_button.dart';
import 'buttons/restart_button.dart';
import 'game_board/game_board_view.dart';
import 'score_board/score_view.dart';
import '../../widgets/back_button.dart';
import '../../widgets/base_view.dart';
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
