import 'package:flutter/material.dart';

class IceCreamImageHeader extends StatelessWidget {
  const IceCreamImageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30, left: 10),
          width: width,
          height: height * 0.3,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 113, 124, 199),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70),
            ),
          ),
        ),
        Image.asset(
          'assets/ice/6.png',
          fit: BoxFit.cover,
          width: width,
          height: height * 0.3,
        ),
      ],
    );
  }
}
