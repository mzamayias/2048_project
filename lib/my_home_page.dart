import 'package:flutter/material.dart';
import 'package:project_2048/constants.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPalette["darkGrey"],
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: colorPalette["darkGrey"],
          ),
        ),
      ),
      body: Center(
        child: Text(
          'Flutter Demo Home Page',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
