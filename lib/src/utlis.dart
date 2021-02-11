import 'package:flutter/material.dart';

Map<int, Color> tileBackgroundColor = {
  0: Colors.blue[50],
  2: Colors.blue[50],
  4: Colors.blue[100],
  8: Colors.blue[200],
  16: Colors.blue[300],
  32: Colors.blue[400],
  64: Colors.blue[500],
  128: Colors.blue[600],
  256: Colors.blue[700],
  512: Colors.blue[800],
  1024: Colors.blue[900],
  2048: Colors.indigo[900],
  4096: Colors.indigo[900],
  8192: Colors.indigo[900],
  16384: Colors.indigo[900],
};

Map<int, Color> tileTextColor = {
  0: Colors.grey[850],
  2: Colors.grey[850],
  4: Colors.grey[850],
  8: Colors.grey[850],
  16: Colors.grey[850],
  32: Colors.grey[850],
  64: Colors.grey[50],
  128: Colors.grey[50],
  256: Colors.grey[50],
  512: Colors.grey[50],
  1024: Colors.grey[50],
  2048: Colors.grey[50],
  4096: Colors.grey[50],
  8192: Colors.grey[50],
  16384: Colors.grey[50],
};

Map<int, double> tileTextFontSize = {
  0: 30,
  2: 30,
  4: 30,
  8: 30,
  16: 30,
  32: 30,
  64: 30,
  128: 24,
  256: 24,
  512: 24,
  1024: 21,
  2048: 21,
  4096: 21,
  8192: 21,
  16384: 21,
};

BorderRadiusGeometry borderRadius = BorderRadius.all(Radius.circular(21));
EdgeInsets padding = EdgeInsets.all(21);
double moveInterval = 0.3;
double elevation = 3;
Color gameBoardBackgroundColor = Colors.cyan[700].withOpacity(0.9);
Color shadowColor = Colors.grey[850];
