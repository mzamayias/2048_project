import 'package:flutter/material.dart';

class BlueprintView extends StatelessWidget {
  const BlueprintView({
    Key key,
    this.viewTitle,
    this.children,
  }) : super(key: key);

  final String viewTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[200],
        foregroundColor: Colors.blueGrey[200],
        elevation: 0,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          viewTitle,
          style: TextStyle(
            color: Colors.blueAccent[700],
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.grey[50],
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ),
      ),
    );
  }
}
