import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_2048/src/utlis.dart';
import 'package:project_2048/src/views/game/playing_area/swipe_controller.dart';

import '../../../models/game/playing_area/game_board/tile.dart';
import 'buttons/restart_button.dart';
import 'game_board/tile_view.dart';

class GameBoard extends StatefulWidget {
  @override
  GameBoardState createState() => GameBoardState();
}

class GameBoardState extends State<GameBoard>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  List<List<Tile>> grid = List.generate(
    4,
    (y) => List.generate(
      4,
      (x) => Tile(x, y, 0),
    ),
  );
  List<Tile> toAdd = [];

  Iterable<Tile> get gridTiles => grid.expand((e) => e);
  Iterable<Tile> get allTiles => [gridTiles, toAdd].expand((e) => e);
  List<List<Tile>> get gridCols => List.generate(
        4,
        (x) => List.generate(
          4,
          (y) => grid[y][x],
        ),
      );

  Timer aiTimer;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          toAdd.forEach((e) => grid[e.column][e.row].value = e.value);
          gridTiles.forEach((t) => t.resetAnimations());
          toAdd.clear();
        });
      }
    });

    setupNewGame();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackItems = [];

    stackItems.addAll(
      gridTiles.map(
        (t) => TileView(),
      ),
    );

    stackItems.addAll(
      allTiles.map(
        (tile) => AnimatedBuilder(
          animation: controller,
          builder: (context, child) => tile.animatedValue.value == 0
              ? SizedBox()
              : TileView(
                  value: tile.animatedValue.value,
                ),
        ),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SwipeController(
          up: () => merge(mergeUp),
          down: () => merge(mergeDown),
          left: () => merge(mergeLeft),
          right: () => merge(mergeRight),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
            color: gameBoardBackgroundColor,
            shadowColor: shadowColor,
            elevation: elevation,
            child: Stack(
              children: stackItems,
            ),
          ),
        ),
        RestartButton(
          onPressed: setupNewGame,
        ),
      ],
    );
  }

  void merge(bool Function() mergeDirection) {
    setState(() {
      if (mergeDirection()) {
        addNewTiles([2]);
        controller.forward(from: 0);
      }
    });
  }

  bool mergeLeft() => grid.map((e) => mergeTiles(e)).toList().any((e) => e);

  bool mergeRight() =>
      grid.map((e) => mergeTiles(e.reversed.toList())).toList().any((e) => e);

  bool mergeUp() => gridCols.map((e) => mergeTiles(e)).toList().any((e) => e);

  bool mergeDown() => gridCols
      .map((e) => mergeTiles(e.reversed.toList()))
      .toList()
      .any((e) => e);

  bool mergeTiles(List<Tile> tiles) {
    bool didChange = false;
    for (int row = 0; row < tiles.length; row++) {
      for (int column = row; column < tiles.length; column++) {
        if (tiles[column].value != 0) {
          Tile mergeTile = tiles
              .skip(column + 1)
              .firstWhere((t) => t.value != 0, orElse: () => null);
          if (mergeTile != null && mergeTile.value != tiles[column].value) {
            mergeTile = null;
          }
          if (row != column || mergeTile != null) {
            didChange = true;
            int resultValue = tiles[column].value;
            tiles[column].moveTo(controller, tiles[row].row, tiles[row].column);
            if (mergeTile != null) {
              resultValue += mergeTile.value;
              mergeTile.moveTo(controller, tiles[row].row, tiles[row].column);
              mergeTile.bounce(controller);
              mergeTile.changeNumber(controller, resultValue);
              mergeTile.value = 0;
              tiles[column].changeNumber(controller, 0);
            }
            tiles[column].value = 0;
            tiles[row].value = resultValue;
          }
          break;
        }
      }
    }
    return didChange;
  }

  void addNewTiles(List<int> values) {
    List<Tile> empty = gridTiles.where((tile) => tile.value == 0).toList();
    empty.shuffle();
    for (int index = 0; index < values.length; index++) {
      toAdd.add(
        Tile(empty[index].row, empty[index].column, values[index])
          ..appear(controller),
      );
    }
  }

  void setupNewGame() {
    setState(() {
      gridTiles.forEach((tile) {
        tile.value = 0;
        tile.resetAnimations();
      });
      toAdd.clear();
      addNewTiles([2, 2]);
      controller.forward(from: 0);
    });
  }
}
