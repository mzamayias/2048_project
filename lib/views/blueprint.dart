import 'package:flutter/material.dart';

class BlueprintView extends StatelessWidget {
  const BlueprintView({
    Key key,
    this.string,
    this.child,
  }) : super(key: key);

  final String string;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        foregroundColor: Colors.blueAccent[400],
        title: Text(
          string,
          style: TextStyle(
            color: Colors.grey[200],
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[200],
        child: child,
      ),
    );
  }
}
