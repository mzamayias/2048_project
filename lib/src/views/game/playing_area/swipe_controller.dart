import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SwipeController extends StatelessWidget {
  final Function() up;
  final Function() down;
  final Function() left;
  final Function() right;
  final Widget child;

  const SwipeController({
    Key key,
    this.up,
    this.down,
    this.left,
    this.right,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleGestureDetector(
      onHorizontalSwipe: (direction) {
        if (direction == SwipeDirection.left) {
          left();
        } else {
          right();
        }
      },
      onVerticalSwipe: (direction) {
        if (direction == SwipeDirection.up) {
          up();
        } else {
          down();
        }
      },
      swipeConfig: SimpleSwipeConfig(
        verticalThreshold: 60,
        horizontalThreshold: 60,
        swipeDetectionBehavior: SwipeDetectionBehavior.singularOnEnd,
      ),
      child: child,
    );
  }
}
