import 'package:flutter/material.dart';
import '../../../../utlis.dart';

class TileView extends StatelessWidget {
  final int value;

  const TileView({
    Key key,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      elevation: 3,
      color:
          value != null ? tileBackgroundColor[value] : tileBackgroundColor[0],
      shadowColor: Colors.grey[850],
      child: Padding(
        padding: const EdgeInsets.all(9),
        child: Center(
          child: Text(
            value != null
                ? value != 1
                    ? '$value'
                    : ""
                : "",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: value != null ? tileTextColor[value] : tileTextColor[0],
              fontSize:
                  value != null ? tileTextFontSize[value] : tileTextFontSize[0],
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
