// import flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import pub packages
import 'package:colorful_safe_area/colorful_safe_area.dart';

// import custom packages
import 'package:project_2048/views/current_page.dart';

void main() => runApp(Project2048());

class Project2048 extends StatefulWidget {
  const Project2048({Key key}) : super(key: key);
  @override
  _Project2048State createState() => _Project2048State();
}

class _Project2048State extends State<Project2048> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: ColorfulSafeArea(
          color: Colors.grey[50],
          child: CurrentPage(),
        ),
      ),
    );
  }
}
