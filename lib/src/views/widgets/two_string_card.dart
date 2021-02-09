import 'package:flutter/material.dart';

class TwoStringCard extends StatelessWidget {
  const TwoStringCard({
    Key key,
    @required this.dataType,
    @required this.dataValue,
  }) : super(key: key);

  final String dataType;
  final String dataValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(21)),
        ),
        color: Colors.lightBlue[900],
        child: Padding(
          padding: EdgeInsets.all(21.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dataType,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    dataValue,
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.grey[50],
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
