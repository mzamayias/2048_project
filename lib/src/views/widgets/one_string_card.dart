import 'package:flutter/material.dart';

class OneStringCard extends StatelessWidget {
  const OneStringCard({
    Key key,
    this.cardText,
  }) : super(key: key);

  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(21)),
        color: Colors.grey[850],
      ),
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
