// import packages
import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    Key key,
    @required this.viewTitle,
    this.children,
  }) : super(key: key);

  final String viewTitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColorfulSafeArea(
        color: Colors.grey[50],
        child: Container(
          alignment: Alignment.topCenter,
          color: Colors.grey[50],
          child: Padding(
            padding: const EdgeInsets.all(21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
