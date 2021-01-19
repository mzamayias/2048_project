import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlueprintView extends StatelessWidget {
  const BlueprintView({
    Key key,
    this.text,
    this.fontSize,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    double ratio = 1.1;
    double width = MediaQuery.of(context).size.width / ratio;
    double height = MediaQuery.of(context).size.height / ratio;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          color: backgroundColor,
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.firaSans(
                fontSize: fontSize,
                color: textColor
              ),
            ),
          ),
        ),
      ),
    );
  }
}
