// import packages
import 'package:flutter/material.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        elevation: 0,
        shadowColor: Colors.grey[850],
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        title: Text(
          viewTitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.jura(
            textStyle: TextStyle(
              color: Colors.blueAccent[700],
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
      body: ColorfulSafeArea(
        color: Colors.grey[50],
        child: Container(
          alignment: Alignment.topCenter,
          color: Colors.grey[50],
          child: Padding(
            padding: EdgeInsets.all(21),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
