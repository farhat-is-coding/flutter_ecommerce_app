import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_ecommerce_app/screens/home/components/items_card.dart';

class IceCreamItemsSlider extends StatefulWidget {
  IceCreamItemsSlider({super.key});

  @override
  State<IceCreamItemsSlider> createState() => _IceCreamItemsSliderState();
}

class _IceCreamItemsSliderState extends State<IceCreamItemsSlider> {
  int idx = 0;
  bool showContent = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      child: Swiper(
        
        onIndexChanged: (value) {
          setState(() {
            showContent = false;
          });
          Future.delayed(Duration(milliseconds: 50), () {
            setState(() {
              idx = value;
              showContent = true;
              
            });
          });
        },
        layout: SwiperLayout.CUSTOM,
        customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
          // ..addScale(values, alignment)
          ..addRotate([-45.0 / 180, 0.0, 45.0 / 180])
          ..addTranslate([
            const Offset(-420.0, -40.0),
            const Offset(0.0, 0.0),
            const Offset(420.0, -40.0)
          ]),
        itemWidth: width * 0.9,
        itemHeight: height * 0.45,
        itemBuilder: (context, index) {
          return IceCreamItemsSliderCard(index: index, showContent: showContent, idx:idx);
        },
        itemCount: 5,
      ),
    );
  }
}
