import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  const BaseView({
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
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: 69,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            viewTitle,
            style: TextStyle(
                color: Colors.grey[850],
                fontWeight: FontWeight.bold,
                fontSize: 27),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            // child: ListView.builder(
            //   itemCount: children.length,
            //   itemBuilder: (BuildContext context, int index) => children[index],
            //   shrinkWrap: true,
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
