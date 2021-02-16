import 'package:flutter/material.dart';
import 'package:project_2048/src/utlis.dart';

class SplashscreenCard extends StatelessWidget {
  const SplashscreenCard({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey[850],
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      elevation: 21,
      color: Colors.grey[50],
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
