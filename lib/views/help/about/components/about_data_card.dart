// import packages
import 'package:flutter/material.dart';

class AboutDataCard extends StatelessWidget {
  const AboutDataCard({
    Key key,
    @required this.flex,
    @required this.dataType,
    @required this.dataValue,
  }) : super(key: key);

  final int flex;
  final String dataType;
  final String dataValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Card(
        color: Colors.cyan[700],
        shadowColor: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(21.0)),
        ),
        child: Padding(
          padding: EdgeInsets.all(21.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    dataType,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey[50],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
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
