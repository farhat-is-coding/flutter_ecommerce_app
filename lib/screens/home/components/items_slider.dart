import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/cubit/icecream/icecream_cubit.dart';
import 'package:flutter_ecommerce_app/cubit/swiper_cubit/swiper_cubit.dart';
import 'package:flutter_ecommerce_app/screens/home/components/items_card.dart';

class IceCreamItemsSlider extends StatelessWidget {
  IceCreamItemsSlider({super.key});

  // if I was making a cubit of this, I wouldve updated the index in the cubit
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final swiperCubit =
        context.select((SwiperCubit swiperCubit) => swiperCubit);
          final icecreamCubit =
        context.select((IcecreamCubit icecreamCubit) => icecreamCubit);
    return SizedBox(
      height: height * 0.5,
      child: Swiper(
        onIndexChanged: (value) {
          // call the cubit here
          swiperCubit.startSwiper(value);
          // context.read<SwiperCubit>().startSwiper(value);

          // setState(() {
          //   showContent = false;
          // });
          // Future.delayed(Duration(milliseconds: 50), () {
          //   setState(() {
          //     idx = value;
          //     showContent = true;
          //   });
          // });
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
          return BlocProvider.value(
            value: swiperCubit,
            child: IceCreamItemsSliderCard(index: index, iceCream: icecreamCubit.iceCreamData[index]),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
