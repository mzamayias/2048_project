class Tile {
  int row;
  int column;
  int value = 0;
  bool isMerged;

  Tile({
    this.row,
    this.column,
    this.value,
    this.isMerged,
  });

  /// Checks if tile is empty (has value of 0).
  bool isEmpty() => this.value == 0;
}
