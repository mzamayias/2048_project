import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_2048/views/home.dart';
import 'package:project_2048/views/playing_ground.dart';

import 'views/current.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
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
          statusBarColor: Colors.grey[200],
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.grey[200],
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        child: Scaffold(
          body: HomeView(),
        ),
      ),
    );
  }
}
