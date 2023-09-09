import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class IceCreamImageHeader extends StatelessWidget {
  final String iceCreamImgUrl;
  const IceCreamImageHeader({super.key, required this.iceCreamImgUrl});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, left: 10),
          width: width,
          height: height * 0.3,
          decoration: const BoxDecoration(
            color: Color(0xff6E7E98),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70),
            ),
          ),
        ),
        // Image.asset(
        //   iceCreamImgUrl,
        //   fit: BoxFit.cover,
        //   width: width,
        //   height: height * 0.3,
        // ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            iceCreamImgUrl,
            width: width,
            height: height * 0.3,
            fit: BoxFit.cover,
          ).animate().shimmer(
                delay: 2.seconds,
                duration: 1.seconds,
              ),
        ),
      ],
    );
  }
}
