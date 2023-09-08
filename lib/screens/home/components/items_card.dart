import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/cubit/swiper_cubit/swiper_cubit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:palette_generator/palette_generator.dart';

//will be replaced by state
import '../../icecreamdata.dart';

class IceCreamItemsSliderCard extends StatelessWidget {
  final int index;
  const IceCreamItemsSliderCard({
    super.key,
    required this.index,
  });

  // updateAnimation(){
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(iceCreamData[index].bgColor),
      ),
      child: BlocBuilder<SwiperCubit, SwiperState>(
        builder: (context, state) {
          return Stack(children: [
            ...switch (state) {
              // !widget.showContent || widget.idx != index
              // super initial means that the swiper is not swiping
              SwiperInitial() => state.idx == index
                  ? [
                      BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 0.95,
                          sigmaY: 0.95,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 8.0,
                            ),
                            child: Text(
                              '${iceCreamData[index].name}',
                              style: TextStyle(
                                  color: Color(iceCreamData[index].textColor),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12.0,
                                vertical: 8.0,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(iceCreamData[index].btnColor)),
                                child: Text(
                                  '${iceCreamData[index].flavor}',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Transform.rotate(
                        angle: 0.55,
                        child: Transform.translate(
                          offset: const Offset(0, -10),
                          child: Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                width: width * 0.75,
                                '${iceCreamData[index].imgurl}',
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () {
                              log('sending the cart event');
                              log('${iceCreamData[index].name}');
                              context
                                  .read<CartBloc>()
                                  .add(AddIceCreamEvent(iceCreamData[index]));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey.shade700.withOpacity(.7),
                              ),
                              height: height * 0.075,
                              width: width * 0.45,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Add to Cart',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                      .animate(interval: 250.milliseconds)
                      .fadeIn(duration: 250.milliseconds)
                      .animate()
                      .shimmer(delay: 1.seconds)
                  : [
                      Container(),
                    ],

              // swiping means that the swiper is swiping
              Swiping() => [Center(child: Container())],
            }
          ]);
        },
      ),
    );
  }

  // Future<PaletteGenerator> _updatePaletteGenerator(String url) async {
  //   return await PaletteGenerator.fromImageProvider(
  //     Image.asset(url).image,
  //   );
  // }
}
