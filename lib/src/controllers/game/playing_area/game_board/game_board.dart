import 'dart:math' show Random;
import 'tile.dart';

class GameBoard {
  final int row;
  final int column;
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


}
