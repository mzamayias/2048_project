import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

import 'home.dart';
import 'playing_ground.dart';

class CurrentView extends StatelessWidget {
  const CurrentView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Swiper(
        itemCount: 3,
        indicatorLayout: PageIndicatorLayout.NONE,
      ),
    );
  }
}
