import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_2048/src/views/game/playing_area/game_board/tile_view.dart';

class GameBoardView extends StatefulWidget {
  const GameBoardView({Key key}) : super(key: key);

  @override
  _GameBoardViewState createState() => _GameBoardViewState();
}

class _GameBoardViewState extends State<GameBoardView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      color: Colors.cyan[700].withOpacity(0.9),
      shadowColor: Colors.grey[850],
      elevation: 3,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(9),
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            children: List.generate(
              16,
              (index) {
                int powerOfTwo = pow(2, index);
                if (2 <= powerOfTwo && powerOfTwo <= 2048) {
                  return TileView(
                    value: powerOfTwo,
                  );
                } else {
                  return TileView(
                    value: null,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
