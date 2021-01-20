/// Class for game's tiles.
class Tile {
  int _horizontalPosition; //  tile's horizontal position on board
  int _verticalPosition; //  tile's vertical position on board
  int _value = 0; //  tile's value, defaults to 0
  bool _canMerge; //  tile's ability to merge with other tiles
  bool _isNew; //  tile's binary "age"

  /// Checks if tile is empty. A tile is empty when its value is 0.
  bool isEmpty() => _value == 0;

  /// Overrides tile's hashCode to tile value's hashCode.
  @override
  int get hashCode => _value.hashCode;

  /// Overrides operator == for Tile class.
  @override
  operator ==(otherTile) => otherTile is Tile && _value == otherTile._value;

  /// Constructor
  Tile(
    this._horizontalPosition,
    this._verticalPosition,
    this._value,
    this._canMerge,
    this._isNew,
  );

  /// Getter for tile's _horizontalPosition.
  int get horizontalPosition => _horizontalPosition;

  /// Setter for tile's _horizontalPosition.
  set horizontalPosition(int value) {
    _horizontalPosition = value;
  }

  /// Getter for tile's _verticalPosition.
  int get verticalPosition => _verticalPosition;

  /// Setter for tile's _verticalPosition.
  set verticalPosition(int value) {
    _verticalPosition = value;
  }

  /// Getter for tile's _value.
  int get value => _value;

  /// Setter for tile's _value.
  set value(int value) {
    _value = value;
  }

  /// Getter for tile's _canMerge.
  bool get canMerge => _canMerge;

  /// Setter for tile's _canMerge.
  set canMerge(bool value) {
    _canMerge = value;
  }

  /// Getter for tile's _isNew.
  bool get isNew => _isNew;

  /// Setter for tile's _isNew.
  set isNew(bool value) {
    _isNew = value;
  }
}
