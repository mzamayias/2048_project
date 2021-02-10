import 'package:flutter/material.dart';

import '../../../utlis.dart';

class TileView extends StatelessWidget {
  final double x;
  final double y;
  final double containerSize;
  final double size;
  final int value;
  final Color color;

  const TileView({
    Key key,
    this.x,
    this.y,
    this.containerSize,
    this.size,
    this.value,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: Container(
        width: containerSize,
        height: containerSize,
        child: Center(
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: color,
            ),
            child: Center(
              child: Text(
                value != null
                    ? value != 1
                        ? '$value'
                        : ""
                    : "",
                style: TextStyle(
                  color: tileTextColor[value],
                  fontSize: value != null
                      ? tileTextFontSize[value]
                      : tileTextFontSize[30],
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
