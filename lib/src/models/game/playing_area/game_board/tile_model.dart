
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../utlis.dart';

class Tile {
  final int row;
  final int column;

  int value;

  Animation<double> animatedX;
  Animation<double> animatedY;
  Animation<double> size;

  Animation<int> animatedValue;

  Tile(this.row, this.column, this.value) {
    resetAnimations();
  }

  void resetAnimations() {
    animatedX = AlwaysStoppedAnimation(row.toDouble());
    animatedY = AlwaysStoppedAnimation(column.toDouble());
    size = AlwaysStoppedAnimation(1.0);
    animatedValue = AlwaysStoppedAnimation(value);
  }

  void moveTo(Animation<double> parent, int x, int y) {
    Animation<double> curved = CurvedAnimation(
      parent: parent,
      curve: Interval(
        0.0,
        moveInterval,
      ),
    );
    animatedX = Tween(
      begin: this.row.toDouble(),
      end: x.toDouble(),
    ).animate(curved);
    animatedY = Tween(
      begin: this.column.toDouble(),
      end: y.toDouble(),
    ).animate(curved);
  }

  void bounce(Animation<double> parent) {
    size = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 1.0),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 1.0),
    ]).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(
          moveInterval,
          1.0,
        ),
      ),
    );
  }

  void changeNumber(Animation<double> parent, int newValue) {
    animatedValue = TweenSequence([
      TweenSequenceItem(tween: ConstantTween(value), weight: .01),
      TweenSequenceItem(tween: ConstantTween(newValue), weight: .99),
    ]).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(
          moveInterval,
          1.0,
        ),
      ),
    );
  }

  void appear(Animation<double> parent) {
    size = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: parent,
        curve: Interval(
          moveInterval,
          1.0,
        ),
      ),
    );
  }
}
