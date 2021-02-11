import 'package:flutter/material.dart';
import 'package:project_2048/src/utlis.dart';
import 'package:project_2048/src/views/game/playing_area/swipe_controller.dart';

import '../../../../models/game/playing_area/game_board/tile.dart';

import 'tile_view.dart';

class GameBoardView extends StatefulWidget {
  @override
  GameBoardViewState createState() => GameBoardViewState();
}

class GameBoardViewState extends State<GameBoardView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  // 2D array of tiles.
  List<List<Tile>> _gameBoard = List.generate(
    4,
    (row) => List.generate(
      4,
      (column) => Tile(column, row, 0),
    ),
  );

  List<Tile> _toAdd = [];

  Iterable<Tile> get _allTiles =>
      [_flattenedGameBoard, _toAdd].expand((e) => e);

  Iterable<Tile> get _flattenedGameBoard => _gameBoard.expand((e) => e);

  List<List<Tile>> get _transposedGameBoard => List.generate(
        4,
        (row) => List.generate(
          4,
          (column) => _gameBoard[column][row],
        ),
      );

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 210),
      vsync: this,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _toAdd.forEach(
            (tile) => _gameBoard[tile.column][tile.row].value = tile.value,
          );
          _flattenedGameBoard.forEach(
            (tile) => tile.resetAnimations(),
          );
          _toAdd.clear();
        });
      }
    });
    setupNewGame();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _stackItems = [];
    _stackItems.addAll(
      _allTiles.map(
        (tile) => AnimatedBuilder(
          animation: _controller,
          builder: (context, child) => tile.animatedValue.value == 0
              ? TileView()
              : TileView(
                  value: tile.animatedValue.value,
                ),
        ),
      ),
    );
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        color: gameBoardBackgroundColor,
        shadowColor: shadowColor,
        elevation: elevation,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: SwipeController(
            up: () => merge(mergeUp),
            down: () => merge(mergeDown),
            left: () => merge(mergeLeft),
            right: () => merge(mergeRight),
            child: GridView.count(
              mainAxisSpacing: 1.5,
              crossAxisSpacing: 1.5,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: _stackItems,
            ),
          ),
        ),
      ),
    );
  }

  void merge(bool Function() mergeDirection) {
    setState(() {
      if (mergeDirection()) {
        addNewTiles([2]);
        _controller.forward(from: 0);
      }
    });
  }

  bool mergeLeft() {
    return _gameBoard.map((e) => mergeTiles(e)).toList().any((e) => e);
  }

  bool mergeRight() {
    return _gameBoard
        .map((e) => mergeTiles(e.reversed.toList()))
        .toList()
        .any((e) => e);
  }

  bool mergeUp() {
    return _transposedGameBoard
        .map((e) => mergeTiles(e))
        .toList()
        .any((e) => e);
  }

  bool mergeDown() {
    return _transposedGameBoard
        .map((e) => mergeTiles(e.reversed.toList()))
        .toList()
        .any((e) => e);
  }

  bool mergeTiles(List<Tile> tiles) {
    bool didChange = false;
    for (int row = 0; row < tiles.length; row++) {
      for (int column = row; column < tiles.length; column++) {
        if (tiles[column].value != 0) {
          Tile mergeTile = tiles
              .skip(column + 1)
              .firstWhere((tile) => tile.value != 0, orElse: () => null);
          if (mergeTile != null && mergeTile.value != tiles[column].value) {
            mergeTile = null;
          }
          if (row != column || mergeTile != null) {
            didChange = true;
            int resultValue = tiles[column].value;
            tiles[column]
                .moveTo(_controller, tiles[row].row, tiles[row].column);
            if (mergeTile != null) {
              resultValue += mergeTile.value;
              mergeTile.moveTo(_controller, tiles[row].row, tiles[row].column);
              mergeTile.bounce(_controller);
              mergeTile.changeNumber(_controller, resultValue);
              mergeTile.value = 0;
              tiles[column].changeNumber(_controller, 0);
            }
            tiles[column].value = 0;
            tiles[row].value = resultValue;
          }
          break;
        }
      }
    }
    _controller.forward(from: 0);
    return didChange;
  }

  void addNewTiles(List<int> values) {
    List<Tile> empty =
        _flattenedGameBoard.where((tile) => tile.value == 0).toList();
    empty.shuffle();
    for (int index = 0; index < values.length; index++) {
      _toAdd.add(
        Tile(
          empty[index].row,
          empty[index].column,
          values[index],
        )..appear(_controller),
      );
    }
    _controller.forward(from: 0);
  }

  void setupNewGame() {
    setState(() {
      _flattenedGameBoard.forEach((tile) {
        tile.value = 0;
        tile.resetAnimations();
      });
      _toAdd.clear();
      addNewTiles([2, 2]);
      _controller.forward(from: 0);
    });
  }
}
