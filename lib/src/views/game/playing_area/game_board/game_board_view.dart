import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_2048/src/views/widgets/one_string_card.dart';

class GameBoardView extends StatelessWidget {
  const GameBoardView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(21)),
      ),
      color: Colors.cyan[700],
      shadowColor: Colors.grey[850],
      elevation: 3,
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(21),
          child: Stack(
            alignment: Alignment.center,
            children: [
              GridView.count(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 4,
                children: List.generate(
                  16,
                  (index) => OneStringCard(
                    cardText: index.toString(),
                  ),
                ),
              ),
              Text(
                'Here you\'ll play the game. It needs to be implemented. ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.amber[900],
                  fontSize: 39,
                  backgroundColor: Colors.cyanAccent.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
