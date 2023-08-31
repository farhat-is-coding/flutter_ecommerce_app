import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home/components/showcase_card.dart';

class ShowcaseSlider extends StatelessWidget {
  const ShowcaseSlider({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(1),
          colors: [
            Color(0xff19A9C1),
            Color(0xff45BDC3),
            Color(0xff19A9C1),
            Color(0xff43C7CB),
          ],
        ),
      ),
      height: height * 0.24,
      child: Swiper(
        // onIndexChanged: (value) {
        //   log(value.toString());
        //   // run the animation again if the index is the index passed
        // },
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ShowcaseSliderCard(
              index: index,
            ),
          );
        },
        itemCount: 5,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
