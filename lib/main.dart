// import flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import pub packages
import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:google_fonts/google_fonts.dart';

// import custom packages
// import 'src/views/current_view.dart';
import 'src/views/splashscreen_view.dart';


void main() => runApp(const Project2048());

/// The app. Here begins the project.
class Project2048 extends StatefulWidget {
  /// Constructor for this widget.
  const Project2048({Key key}) : super(key: key);
  @override
  _Project2048State createState() => _Project2048State();
}

class _Project2048State extends State<Project2048> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.juraTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: ColorfulSafeArea(
          color: Colors.grey[50],
          child: SplashscreenView(),
        ),
      ),
    );
  }
}
