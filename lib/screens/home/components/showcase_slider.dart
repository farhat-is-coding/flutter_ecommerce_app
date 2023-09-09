// import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/cubit/icecream/icecream_cubit.dart';
import 'package:flutter_ecommerce_app/screens/home/components/showcase_card.dart';

class ShowcaseSlider extends StatelessWidget {
  const ShowcaseSlider({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final icecreamCubit =
        context.select((IcecreamCubit icecreamCubit) => icecreamCubit);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(1),
          colors: [
            Color.fromARGB(255, 111, 118, 147),
            Color.fromARGB(255, 140, 148, 184),
            Color.fromARGB(255, 111, 118, 147),
            Color.fromARGB(255, 140, 148, 184),
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
              iceCream: icecreamCubit.iceCreamData[index],
            ),
          );
        },
        itemCount: 5,
        pagination: const SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.white,
            activeColor: Color.fromARGB(255, 170, 170, 170),
          ),
        ),
        control: const SwiperControl(color: Colors.white),
      ),
    );
  }
}
