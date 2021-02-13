// import Random from math
import 'dart:math' show Random;
// import flutter packages
import 'package:flutter/material.dart';
// import custom packages
import '../../../../utlis.dart';
import 'swipe_controller.dart';
import 'tile_view.dart';
import '../../../../models/game/playing_area/game_board/score_model.dart';
import '../../../../models/game/playing_area/game_board/tile_model.dart';

class GameBoardView extends StatefulWidget {
  @override
  GameBoardViewState createState() => GameBoardViewState();
}

class GameBoardViewState extends State<GameBoardView>
    with SingleTickerProviderStateMixin {
  // Singleton for score
  ScoreModel scoreModel = ScoreModel();

  // Animation controller
  AnimationController controller;

  // 2D array of tiles
  List<List<TileModel>> gameBoard = List.generate(
    4,
    (row) => List.generate(
      4,
      (column) => TileModel(row, column, 0),
    ),
  );

  // Getter for flattened game board
  Iterable<TileModel> get flattenedGameBoard => gameBoard.expand((row) => row);

  // Getter for transposed game board (rows as columns, columns as rows)
  List<List<TileModel>> get transposedGameBoard => List.generate(
        4,
        (row) => List.generate(
          4,
          (column) => gameBoard[column][row],
        ),
      );

  // List of tiles to add to game board
  List<TileModel> toAdd = [];

  // Getter fot all tiles in flattened game board and to add list
  Iterable<TileModel> get allTiles =>
      [flattenedGameBoard, toAdd].expand((tile) => tile);

  // Initalize state
  @override
  void initState() {
    super.initState();

    // Animation controlller configuration
    controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    // Listen for changes in animation controller
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          toAdd.forEach(
            (tile) => gameBoard[tile.row][tile.column].value = tile.value,
          );
          flattenedGameBoard.forEach(
            (tile) => tile.resetAnimations(),
          );
          toAdd.clear();
        });
      }
    });

    // Setup new game.
    setupNewGame();
  }

  /// Add new random tiles to game board randomly.
  void addNewTiles(List<int> values) {
    // A list of empty tiles
    List<TileModel> empty =
        flattenedGameBoard.where((tile) => tile.value == 0).toList();
    empty.shuffle();
    for (int index = 0; index < values.length; index++) {
      toAdd.add(
        TileModel(
          empty[index].row,
          empty[index].column,
          values[index],
        )..appear(controller),
      );
    }
  }

  /// Random tile value.
  /// There are 10% chances to get a 4 as a new tile, and
  /// 90% chances to get a 2.
  int randomTileValue() {
    // Create a random number generator
    Random rng = Random();
    // Select a random int in range 0 inclusive, 10 exlusive.
    // If that number is 0 (10% chance) then return 4,
    // else (90% chance) return 2.
    return rng.nextInt(9) == 0 ? 4 : 2;
  }

  void setupNewGame() {
    setState(() {
      flattenedGameBoard.forEach((tile) {
        tile.value = 0;
        tile.resetAnimations();
      });
      toAdd.clear();
      addNewTiles([randomTileValue(), randomTileValue()]);
      controller.forward(from: 0);
      scoreModel.score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> stackItems = [];

    /// Game board with no animimations
    stackItems.addAll(
      allTiles.map(
        (tile) => tile.animatedValue.value == 0
            ? TileView()
            : TileView(
                value: tile.animatedValue.value,
              ),
      ),
    );

    /// Game board with animimations
    // stackItems.addAll(
    //   allTiles.map(
    //     (tile) => AnimatedBuilder(
    //       animation: controller,
    //       builder: (context, child) => tile.animatedValue.value == 0
    //           ? TileView()
    //           : TileView(
    //               value: tile.animatedValue.value,
    //             ),
    //     ),
    //   ),
    // );

    // Render widget
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
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              children: stackItems,
            ),
          ),
        ),
      ),
    );
  }

  void merge(bool Function() mergeDirection) {
    setState(() {
      if (mergeDirection()) {
        addNewTiles([randomTileValue()]);
        controller.forward(from: 0);
      }
    });
  }

  bool mergeLeft() {
    return gameBoard
        .map((tile) => mergeTiles(tile))
        .toList()
        .any((tile) => tile);
  }

  bool mergeRight() {
    return gameBoard
        .map((tile) => mergeTiles(tile.reversed.toList()))
        .toList()
        .any((tile) => tile);
  }

  bool mergeUp() {
    return transposedGameBoard
        .map((tile) => mergeTiles(tile))
        .toList()
        .any((tile) => tile);
  }

  bool mergeDown() {
    return transposedGameBoard
        .map((tile) => mergeTiles(tile.reversed.toList()))
        .toList()
        .any((tile) => tile);
  }

  bool mergeTiles(List<TileModel> tiles) {
    bool didChange = false;

    /// Iterate through game board rows
    for (int row = 0; row < tiles.length; row++) {
      /// Iterate through game board column
      for (int column = row; column < tiles.length; column++) {
        if (tiles[column].value != 0) {
          /// Search for the first tile [.firstWhere(] that's not at this index
          /// [tiles.skip(column + 1)] and not empty
          /// [(tile) => tile.value != 0,]. If there's no such tile, return null
          /// [orElse: () => null,].
          TileModel mergeTile = tiles.skip(column + 1).firstWhere(
                (tile) => tile.value != 0,
                orElse: () => null,
              );

          /// Check if the found tile [mergeTile] is different than this tile
          /// [tiles[column]] (they should have different values). If it's the
          /// same do nothing, else nullify found tile [mergeTile = null].
          if (mergeTile != null && mergeTile.value != tiles[column].value) {
            mergeTile = null;
          }
          // Check if row and column are different
          if (row != column || mergeTile != null) {
            didChange = true; // There will be a game board change
            int resultValue =
                tiles[column].value; // Result value is the value of this tile
            tiles[column].moveTo(
              controller,
              tiles[row].row,
              tiles[row].column,
            ); // Move tile
            if (mergeTile != null) {
              resultValue += mergeTile.value;
              mergeTile.moveTo(
                controller,
                tiles[row].row,
                tiles[row].column,
              );
              mergeTile.bounce(controller);
              mergeTile.changeNumber(
                controller,
                resultValue,
              );
              mergeTile.value = 0;
              tiles[column].changeNumber(controller, 0);
              scoreModel.score += resultValue;
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
}
