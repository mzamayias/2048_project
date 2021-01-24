import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    Key key,
    this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children ??
            <Widget>[
              Container(),
            ],
      ),
    );
  }
}
