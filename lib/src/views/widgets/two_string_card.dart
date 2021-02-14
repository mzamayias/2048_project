import 'package:flutter/material.dart';

class TwoStringCard extends StatelessWidget {
  const TwoStringCard({
    Key key,
    this.flex,
    @required this.dataType,
    @required this.dataValue,
  }) : super(key: key);

  final int flex;
  final String dataType;
  final String dataValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Card(
        shadowColor: Colors.grey[850],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(21)),
        ),
        elevation: 3,
        color: Colors.lightBlue[900],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 21, right: 21),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      dataType,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
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
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
