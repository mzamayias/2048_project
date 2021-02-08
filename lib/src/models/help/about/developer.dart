import 'package:flutter/material.dart';

class Developer extends ChangeNotifier {
  String firstName;
  String lastName;

  Developer({
    @required this.firstName,
    @required this.lastName,
  });
}
