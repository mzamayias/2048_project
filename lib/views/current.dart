import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'home.dart';
import 'playing_ground.dart';

class CurrentView extends StatelessWidget {
  const CurrentView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewList = [
      HomeView(),
      PlayingGroundView(),
    ];
    return Swiper(
      autoplay: false,
      loop: false,
      layout: SwiperLayout.DEFAULT,
      itemCount: viewList.length,
      itemBuilder: (context, index) => viewList[index],
      viewportFraction: 0.9,
      scale: 0.3,
      curve: Curves.slowMiddle,
      // physics: NeverScrollableScrollPhysics(),
    );
  }
}
