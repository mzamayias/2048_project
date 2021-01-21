import 'dart:math';

import 'package:project_2048/models/board_actions.dart';

import 'tile.dart';
import 'player.dart';

/// Class for game's board.
class Board implements BoardActions {
  int _size; // board's size
  List<List<Tile>> _boardTiles; // board's tiles

  /// Constructor
  Board(
    this._size,
  );

  /// Getter for board's _size.
  int get size => _size;

  /// Setter for board's _size.
  set size(int size) => _size = size;

  /// Getter for board's _boardTiles.
  List<List<Tile>> get boardTiles => _boardTiles;

  /// Setter for board's _boardTiles.
  set boardTiles(List<List<Tile>> value) => _boardTiles = value;

  void resetCanMerge() {
    _boardTiles.forEach((row) {
      row.forEach((tile) {
        tile.canMerge = false;
      });
    });
  }

  /// Function to create a non-empty (non-zero) tile from the grid randomly.
  void randomEmptyTile() {
    List<Tile> emptyTiles; // Create an empty tile list.
    _boardTiles.forEach((row) {
      emptyTiles.addAll(
        row.where(
          (tile) => tile.isEmpty(),
        ),
      );
    }); // Populate empty tile list with empty board tiles.
    if (emptyTiles.isEmpty) {
      return;
    } // If empty tile list is empty, exit.
    Random rng = Random(); // Random number generator.
    // Pick a random index from empty list.
    int index = rng.nextInt(emptyTiles.length);
    // Pick a random number from 0 to 9
    int randomValue = rng.nextInt(9);
    // Set value empty[index] item.
    // If randomValue is 0 or 1 (20% probability) then set tile's value to 4,
    // else set it to 2.
    emptyTiles[index].value = randomValue == 0 || randomValue == 1 ? 4 : 2;
    // Set tile to new
    emptyTiles[index].isNew = true;
    // Remove tile from empty tiles list.
    emptyTiles.removeAt(index);
  }

  /// Initializes board tiles, _boardTiles.
  void initBoard() {
    _boardTiles = List.generate(
      _size,
      (rowIndex) => List.generate(
        _size,
        (columnIndex) => Tile(
          rowIndex,
          columnIndex,
          0,
          false,
          false,
        ),
      ),
    );
    resetCanMerge();
    randomEmptyTile();
    randomEmptyTile();
  }

  bool canMerge(Tile a, Tile b) {
    return !a.canMerge &&
        ((b.isEmpty() && !a.isEmpty() || (!a.isEmpty() && a == b)));
  }

  bool merge(Tile a, Tile b) {
    bool flag;
    if (!canMerge(a, b)) {
      if (!a.isEmpty() && !b.canMerge) {
        b.canMerge = true;
      }
      flag = false;
    }

    if (b.isEmpty()) {
      b.value = a.value;
      a.value = 0;
    } else if (a == b) {
      b.value *= 2;
      a.value = 0;
      flag = true;
      b.canMerge = true;
    } else {
      b.canMerge = true;
    }

    return flag;
  }

  bool canMoveLeft() {
    for (int row = 0; row < this._size; ++row) {
      for (int column = 1; column < this._size; ++column) {
        if (canMerge(_boardTiles[row][column], _boardTiles[row][column - 1])) {
          return true;
        }
      }
    }
    return false;
  }

  bool canMoveRight() {
    for (int row = 0; row < this._size; ++row) {
      for (int column = this._size - 2; column >= 0; --column) {
        if (canMerge(_boardTiles[row][column], _boardTiles[row][column + 1])) {
          return true;
        }
      }
    }
    return false;
  }

  bool canMoveUp() {
    for (int row = 1; row < this._size; ++row) {
      for (int column = 0; column < this._size; ++column) {
        if (canMerge(_boardTiles[row][column], _boardTiles[row - 1][column])) {
          return true;
        }
      }
    }
    return false;
  }

  bool canMoveDown() {
    for (int row = this._size - 2; row >= 0; --row) {
      for (int column = 0; column < this._size; ++column) {
        if (canMerge(_boardTiles[row][column], _boardTiles[row + 1][column])) {
          return true;
        }
      }
    }
    return false;
  }

  void mergeLeft(int row, int column) {
    while (column > 0) {
      merge(_boardTiles[row][column], _boardTiles[row][column - 1]);
      column--;
    }
  }

  void mergeRight(int row, int column) {
    while (column < this._size - 1) {
      merge(_boardTiles[row][column], _boardTiles[row][column + 1]);
      column++;
    }
  }

  void mergeUp(int row, int column) {
    while (row > 0) {
      merge(_boardTiles[row][column], _boardTiles[row - 1][column]);
      row--;
    }
  }

  void mergeDown(int row, int column) {
    while (row < this._size - 1) {
      merge(_boardTiles[row][column], _boardTiles[row + 1][column]);
      row++;
    }
  }

  void moveLeft() {
    if (!canMoveLeft()) {
      return;
    }

    for (int row = 0; row < row; ++row) {
      for (int column = 0; column < this._size; ++column) {
        mergeLeft(row, column);
      }
    }

    randomEmptyTile();
    resetCanMerge();
  }

  void moveRight() {
    if (!canMoveRight()) {
      return;
    }

    for (int row = 0; row < this._size; ++row) {
      for (int column = this._size - 2; column >= 0; --column) {
        mergeRight(row, column);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  void moveUp() {
    if (!canMoveUp()) {
      return;
    }

    for (int row = 0; row < this._size; ++row) {
      for (int column = 0; column < this._size; ++column) {
        mergeUp(row, column);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  void moveDown() {
    if (!canMoveDown()) {
      return;
    }

    for (int row = this._size - 2; row >= 0; --row) {
      for (int column = 0; column < this._size; ++column) {
        mergeDown(row, column);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  bool gameOver() {
    return !canMoveLeft() && !canMoveRight() && !canMoveUp() && !canMoveDown();
  }
}
