// import packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colorful_safe_area/colorful_safe_area.dart';

import 'package:project_2048/views/current_view.dart'; // view

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
          child: CurrentView(),
        ),
      ),
    );
  }
}
