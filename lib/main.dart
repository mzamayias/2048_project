import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          // statusBarColor: Colors.grey[200],
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          // systemNavigationBarColor: Colors.grey[200],
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Colors.transparent,
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.grey[200],
            body: CurrentView(),
          ),
        ),
      ),
    );
  }
}
