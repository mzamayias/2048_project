import 'package:flutter/material.dart';
import 'package:project_2048/src/utlis.dart';

class TileView extends StatelessWidget {
  const TileView({
    Key key,
    this.value,
  }) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      elevation: 3,
      color: tileBackgroundColor[value],
      shadowColor: Colors.grey[850],
      child: Padding(
        padding: EdgeInsets.all(9),
        child: Center(
          child: Text(
            value != null ? value != 1 ? '$value' : "" : "",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: tileTextColor[value],
              fontSize: tileTextFontSize[value],
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
