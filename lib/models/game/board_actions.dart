import 'tile.dart';

abstract class BoardActions {
  void resetCanMerge();
  void randomEmptyTile();
  void initBoard();
  bool canMerge(Tile a, Tile b);
  bool merge(Tile a, Tile b);
  bool canMoveLeft();
  bool canMoveRight();
  bool canMoveUp();
  bool canMoveDown();
  void mergeLeft(int row, int column);
  void mergeRight(int row, int column);
  void mergeUp(int row, int column);
  void mergeDown(int row, int column);
  void moveLeft();
  void moveRight();
  void moveUp();
  void moveDown();
  bool gameOver();
}
