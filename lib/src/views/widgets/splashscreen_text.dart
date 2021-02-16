import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashscreenText extends StatelessWidget {
  const SplashscreenText({
    Key key,
    @required this.data,
    @required this.fontSize,
  }) : super(key: key);

  final String data;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        data,
        textAlign: TextAlign.center,
        style: GoogleFonts.firaCode(
          fontSize: fontSize,
          color: Colors.blueAccent[700],
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
