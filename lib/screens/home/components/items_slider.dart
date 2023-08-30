import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_ecommerce_app/screens/home/components/items_card.dart';

class IceCreamItemsSlider extends StatelessWidget {
  const IceCreamItemsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      child: Swiper(
        layout: SwiperLayout.CUSTOM,
        customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
          ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
          ..addTranslate([
            const Offset(-420.0, -40.0),
            const Offset(0.0, 0.0),
            const Offset(420.0, -40.0)
          ]),
        itemWidth: width * 0.9,
        itemHeight: height * 0.45,
        itemBuilder: (context, index) {
          return IceCreamItemsSliderCard(index: index);
        },
        itemCount: 5,
      ),
    );
  }
}
