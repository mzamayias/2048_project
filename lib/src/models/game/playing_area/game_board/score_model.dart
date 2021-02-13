import 'package:flutter/material.dart';

class ScoreModel extends ChangeNotifier {
  
  ScoreModel.singleton();
  static final ScoreModel _instance = ScoreModel.singleton();
  factory ScoreModel() {
    return _instance;
  }

  int _score;

  int get score => this._score;

  set score(int value) {
    this._score = value;
    notifyListeners();
  }
}
