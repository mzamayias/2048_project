import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:project_2048/src/utlis.dart';
import 'package:project_2048/src/views/current_view.dart';

import 'widgets/splashscreen_card.dart';
import 'widgets/splashscreen_text.dart';

class SplashscreenView extends StatefulWidget {
  @override
  _SplashscreenViewState createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  @override
  void initState() {
    const Duration duration = Duration(
      seconds: 30,
    );
    Future.delayed(
      duration,
      () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return const CurrentView();
          }),
          (route) => false,
        );
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.grey[50],
      child: Scaffold(
        body: Align(
          child: Padding(
            padding: padding,
            child: SplashscreenCard(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  SplashscreenText(
                    data: 'Project',
                    fontSize: 60,
                  ),
                  SplashscreenText(
                    data: '2048',
                    fontSize: 108,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
