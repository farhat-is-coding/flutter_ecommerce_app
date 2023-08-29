import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

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
      height: height * 0.3,
      child: Swiper(
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25.0, top: 5, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              'assets/pattern/1.png',
                            ),
                          ),
                          Text(
                            'Ice Cream',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff4c5cbf),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color.fromARGB(255, 230, 233, 251)),
                        width: width * 0.3,
                        child: const Center(
                          child: Text(
                            'Explore',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff4c5cbf),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Transform.translate(
                  offset: const Offset(40, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'assets/ice/6.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
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
