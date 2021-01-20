/// Class for game's player.
class Player {
  int _score = 0; // player's score

  // Constructor
  Player();

  /// Getter for player's _score.
  int get score => _score;

  /// Setter for player's _score.
  set score(int value) {
    _score = value;
  }
}
