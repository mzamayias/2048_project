import 'dart:math' show Random;
import 'tile_model.dart';

class GameBoard {
  final int row;
  final int column;
  int score;
  List<List<Tile>> gameBoard;

  GameBoard({this.row, this.column});

  /// Initialize game board with empty tiles.
  void initializeGameBoard() {
    // Create a list of tiles list.
    gameBoard = [<Tile>[]];
    // Iterate through game board rows.
    for (int row = 0; row < this.row; row++) {
      // Add a tiles list in each row.
      gameBoard.add(<Tile>[]);
      // Iterate through game board columns.
      for (int column = 0; column < this.column; column++) {
        // Add an empty tile in each column.
        this.gameBoard[row].add(
              Tile(
                row: row,
                column: column,
                value: 0,
                isMerged: false,
              ),
            );
      }
    }
    score = 0;
    createRandomEmptyTile(2);
  }

  /// Create new random tiles for [number] of times.
  void createRandomEmptyTile(int number) {
    // Create a tile's list for all the empty tiles.
    List<Tile> allEmptyTiles = <Tile>[];

    // Iterate through game board rows.
    for (int row = 0; row < this.row; row++) {
      // Iterate through game board columns.
      for (int column = 0; column < this.column; column++) {
        // Check if current tile is empty.
        if (this.gameBoard[row][column].isEmpty()) {
          // If it is empty add it to the list of all empty tiles.
          allEmptyTiles.add(this.gameBoard[row][column]);
        }
      }
    }

    // Check if list of all empty tiles is empty.
    if (allEmptyTiles.isEmpty) {
      // If it is empty return.
      return;
    }

    // Add random tiles [number] of times.
    for (int i = 0; i < number; i++) {
      // Create a random in generator.
      Random rng = Random();
      // Pick a random index from the list of all empty tiles.
      int randomIndex = rng.nextInt(allEmptyTiles.length);
      // Make the tile of this random index not empty.
      // There's a 10% probability that the value of this new tile is 4,
      // the rest 90% probability gives a new tile with value 2.
      // Pick a number from the inclusive range 0 to 9. If this number
      // is 0 then the new tile will have a value of 4, else it will have
      // a value of 2.
      allEmptyTiles[randomIndex].value = rng.nextInt(9) == 0 ? 4 : 2;
      // Remove this index from the list of all empty tiles.
      allEmptyTiles.removeAt(randomIndex);
    }
  }

  /// Check if two tiles, tile [a] and tile [b], can merge.
  /// [a] should not be merged previously, and
  /// [a] and [b] must have the same value and [b] must not be empty, or
  /// [a] is empty and [b] isn't.
  bool canMerge(Tile a, Tile b) {
    return !a.isMerged && (b.value == a.value && !b.isEmpty()) ||
        (a.isEmpty() && !b.isEmpty());
  }

  /// Merge two tiles, tile [a] and tile [b].
  /// If [a] and [b] can't be merged, [b] is merged.
  /// If [a] is empty, then its value is [b]'s value and [b]'s is now empty.
  /// Else if [a] and [b] have the same value, [a]'s value is the
  /// sum of [a]'s and [b]'s values, [a] can't be merged again and [b] is empty.
  /// Else [b] is merged.
  void merge(Tile a, Tile b) {
    if (!canMerge(a, b)) {
      b.isMerged = true;
    }
    if (a.isEmpty()) {
      a.value = b.value;
      b.value = 0;
    } else if (a.value == b.value) {
      a.value = a.value + b.value;
      a.isMerged = true;
      b.value = 0;
    } else {
      b.isMerged = true;
    }
  }

  /// Merge tiles to the left by column, in [row] row and [column] column.
  void mergeLeft(int row, int column) {
    ///column must not reach [0], because of the conditional statement in the loop
    while (column > 0) {
      merge(
        this.gameBoard[row]
            [column - 1], // tile a, is to the left of current tile
        this.gameBoard[row][column], // tile b, is current tile
      );
      column--;
    }
  }

  /// Merge tiles to the top by row, in [row] row and [column] column.
  void mergeUp(int row, int column) {
    /// row must not reach [0], because of the conditional statement in the loop
    while (row > 0) {
      merge(
        this.gameBoard[row - 1]
            [column], // tile a, is to the top of current tile
        this.gameBoard[row][column], // tile b, is current tile
      );
      row--;
    }
  }

  /// Merge tiles to the right by column, in [row] row and [column] column.
  void mergeRight(int row, int column) {
    /// column must not reach [this.column - 1], because of the conditional
    /// statement in the loop
    while (column < this.column - 1) {
      merge(
        this.gameBoard[row]
            [column + 1], // tile a, is to the right of current tile
        this.gameBoard[row][column], // tile b, is current tile
      );
      column++;
    }
  }

  /// Merge tiles to the bottom by row, in [row] row and [column] column.
  void mergeDown(int row, int column) {
    /// row must not reach [this.row - 1], because of the conditional
    /// statement in the loop
    while (row < this.row - 1) {
      merge(
        this.gameBoard[row + 1]
            [column], // tile a, is to the bottom of current tile
        this.gameBoard[row][column], // tile b, is current tile
      );
      row++;
    }
  }

  /// Before merging tiles to the left, it needs to be checked they can move in
  /// this direction. Iterating through all tiles to check for this.
  bool canMoveLeft() {
    for (int row = 0; row < this.row; row++) {
      for (int column = 1; column < this.column; column++) {
        if (canMerge(gameBoard[row][column], gameBoard[row][column - 1])) {
          return true;
        }
      }
    }
    return false;
  }

  /// Before merging tiles to the top, it needs to be checked they can move in
  /// this direction. Iterating through all tiles to check for this.
  bool canMoveUp() {
    for (int row = 1; row < this.row; row++) {
      for (int column = 0; column < this.column; column++) {
        if (canMerge(gameBoard[row][column], gameBoard[row - 1][column])) {
          return true;
        }
      }
    }
    return false;
  }

  /// Before merging tiles to the right, it needs to be checked they can move in
  /// this direction. Iterating through all tiles to check for this.
  bool canMoveRight() {
    for (int row = 0; row < this.row; row++) {
      for (int column = this.column - 2; column > 0; column++) {
        if (canMerge(gameBoard[row][column + 1], gameBoard[row][column])) {
          return true;
        }
      }
    }
    return false;
  }

  /// Before merging tiles to the down, it needs to be checked they can move in
  /// this direction. Iterating through all tiles to check for this.
  bool canMoveDown() {
    for (int row = this.row - 2; row > 0; row++) {
      for (int column = 0; column < this.column; column++) {
        if (canMerge(gameBoard[row + 1][column], gameBoard[row][column])) {
          return true;
        }
      }
    }
    return false;
  }

  void moveLeft() {
    if (!canMoveLeft()) {
      return;
    }
    for (int row = 0; row < this.row; row++) {
      for (int column = 0; column < this.column; column++) {
        mergeLeft(row, column);
      }
    }
    resetMergeState();
    createRandomEmptyTile(1);
  }

  void moveUp() {
    if (!canMoveUp()) {
      return;
    }
    for (int row = 0; row < this.row; row++) {
      for (int column = 0; column < this.column; column++) {
        mergeUp(row, column);
      }
    }
    resetMergeState();
    createRandomEmptyTile(1);
  }

  void moveRight() {
    if (!canMoveRight()) {
      return;
    }
    for (int row = 0; row < this.row; row++) {
      for (int column = this.column - 1; column >= 0; column++) {
        mergeRight(row, column);
      }
    }
    resetMergeState();
    createRandomEmptyTile(1);
  }

  void moveDown() {
    if (!canMoveDown()) {
      return;
    }
    for (int row = this.row - 1; row >= 0; row++) {
      for (int column = 0; column < this.column; column++) {
        mergeDown(row, column);
      }
    }
    resetMergeState();
    createRandomEmptyTile(1);
  }

  void resetMergeState() {
    for (int row = 0; row < this.row; row++) {
      for (int column = 0; column < this.column; column++) {
        gameBoard[row][column].isMerged = false;
      }
    }
  }

  bool isGameOver() {
    return !(canMoveLeft() || canMoveUp() || canMoveRight() || canMoveDown());
  }
}
