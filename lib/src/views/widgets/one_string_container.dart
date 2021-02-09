import 'package:flutter/material.dart';

class OneStringContainer extends StatelessWidget {
  const OneStringContainer({
    Key key,
    this.cardText,
  }) : super(key: key);

  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      elevation: 3,
      color: Colors.grey[850],
      child: Padding(
        padding: EdgeInsets.all(21),
        child: Text(
          cardText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[50],
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
