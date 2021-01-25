import 'package:flutter/material.dart';

class App extends ChangeNotifier {
  String name;
  String version;

  App({
    @required this.name,
    @required this.version,
  });
}
