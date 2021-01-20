import 'dart:math' show Random;

class Board {
  final int row;
  final int column;
  int score;

  Board(this.row, this.column);

  List<List<Tile>> _boardTiles;

  //  done
  void initBoard() {
    _boardTiles = List.generate(
      4,
      (r) => List.generate(
            4,
            (c) => Tile(
                  row: r,
                  column: c,
                  value: 0,
                  isNew: false,
                  canMerge: false,
                ),
          ),
    );

    print(_boardTiles);

    score = 0;
    resetCanMerge();
    randomEmptyTile();
    randomEmptyTile();
  }

  //  done
  void moveLeft() {
    if (!canMoveLeft()) {
      return;
    }

    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < column; ++c) {
        mergeLeft(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  //  done
  void moveRight() {
    if (!canMoveRight()) {
      return;
    }

    for (int r = 0; r < row; ++r) {
      for (int c = column - 2; c >= 0; --c) {
        mergeRight(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  //  done
  void moveUp() {
    if (!canMoveUp()) {
      return;
    }

    for (int r = 0; r < row; ++r) {
      for (int c = 0; c < column; ++c) {
        mergeUp(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  //  done
  void moveDown() {
    if (!canMoveDown()) {
      return;
    }

    for (int r = row - 2; r >= 0; --r) {
      for (int c = 0; c < column; ++c) {
        mergeDown(r, c);
      }
    }
    randomEmptyTile();
    resetCanMerge();
  }

  //  done
  bool canMoveLeft() {
    for (int r = 0; r < row; ++r) {
      for (int c = 1; c < column; ++c) {
        if (canMerge(_boardTiles[r][c], _boardTiles[r][c - 1])) {
          return true;
        }
      }
    }
    return false;
  }

  //  done
  bool canMoveRight() {
    for (int r = 0; r < row; ++r) {
      for (int c = column - 2; c >= 0; --c) {
        if (canMerge(_boardTiles[r][c], _boardTiles[r][c + 1])) {
          return true;
        }
      }
    }
    return false;
  }

  //  done
  bool canMoveUp() {
    for (int r = 1; r < row; ++r) {
      for (int c = 0; c < column; ++c) {
        if (canMerge(_boardTiles[r][c], _boardTiles[r - 1][c])) {
          return true;
        }
      }
    }
    return false;
  }

  //  done
  bool canMoveDown() {
    for (int r = row - 2; r >= 0; --r) {
      for (int c = 0; c < column; ++c) {
        if (canMerge(_boardTiles[r][c], _boardTiles[r + 1][c])) {
          return true;
        }
      }
    }
    return false;
  }

  //  done
  void mergeLeft(int row, int col) {
    while (col > 0) {
      merge(_boardTiles[row][col], _boardTiles[row][col - 1]);
      col--;
    }
  }

  //  done
  void mergeRight(int row, int col) {
    while (col < column - 1) {
      merge(_boardTiles[row][col], _boardTiles[row][col + 1]);
      col++;
    }
  }

  //  done
  void mergeUp(int r, int col) {
    while (r > 0) {
      merge(_boardTiles[r][col], _boardTiles[r - 1][col]);
      r--;
    }
  }

  //  done
  void mergeDown(int r, int col) {
    while (r < row - 1) {
      merge(_boardTiles[r][col], _boardTiles[r + 1][col]);
      r++;
    }
  }

  //  done
  bool canMerge(Tile a, Tile b) {
    return !a.canMerge &&
        ((b.isEmpty() && !a.isEmpty()) || (!a.isEmpty() && a == b));
  }

  //  done
  void merge(Tile a, Tile b) {
    if (!canMerge(a, b)) {
      if (!a.isEmpty() && !b.canMerge) {
        b.canMerge = true;
      }
      return;
    }

    if (b.isEmpty()) {
      b.value = a.value;
      a.value = 0;
    } else if (a == b) {
      b.value = b.value * 2;
      a.value = 0;
      score += b.value;
      b.canMerge = true;
    } else {
      b.canMerge = true;
    }
  }

  //  done
  bool gameOver() {
    return !canMoveLeft() && !canMoveRight() && !canMoveUp() && !canMoveDown();
  }

  //  don't implement
  Tile getTile(int row, int column) {
    return _boardTiles[row][column];
  }

  //  done
  void randomEmptyTile() {
    List<Tile> empty = [];

    _boardTiles.forEach((rows) {
      empty.addAll(rows.where((tile) => tile.isEmpty()));
    });

    if (empty.isEmpty) {
      return;
    }

    Random rng = Random();

    int index = rng.nextInt(empty.length);
    empty[index].value = rng.nextInt(9) == 0 ? 4 : 2;
    empty[index].isNew = true;
    empty.removeAt(index);
  }

  //  done
  void resetCanMerge() {
    _boardTiles.forEach((rows) {
      rows.forEach((tile) {
        tile.canMerge = false;
      });
    });
  }
}

class Tile {
  int row, column;
  int value;
  bool canMerge;
  bool isNew;

  Tile({
    this.row,
    this.column,
    this.value = 0,
    this.canMerge,
    this.isNew,
  });

  bool isEmpty() {
    return value == 0;
  }

  @override
  int get hashCode {
    return value.hashCode;
  }

  @override
  operator ==(other) {
    return other is Tile && value == other.value;
  }
}
