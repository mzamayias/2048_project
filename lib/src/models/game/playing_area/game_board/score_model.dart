import 'package:flutter/material.dart';

class ScoreModel extends ChangeNotifier {
  static final ScoreModel _instance = ScoreModel.singleton();
  factory ScoreModel() {
    return _instance;
  }
  ScoreModel.singleton();

  int _score;

  int get score => _score;

  set score(int value) {
    _score = value;
    notifyListeners();
  }
}
