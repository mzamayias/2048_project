import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:project_2048/views/current_view.dart';

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
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.grey[200],
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: CurrentView(),
      ),
    );
  }
}
