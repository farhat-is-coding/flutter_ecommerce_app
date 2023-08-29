import 'dart:ui';

import 'package:flutter/material.dart';

class IceCreamItemsSliderCard extends StatelessWidget {
  const IceCreamItemsSliderCard({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.lightBlue.shade100,
      ),
      child: Stack(
        children: [
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
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Ice Cream',
                  style: TextStyle(
                      color: Colors.cyanAccent.shade700,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.cyanAccent.shade700),
                child: const Text(
                  'Strawberry',
                  style: TextStyle(color: Colors.white),
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
                  'assets/ice.png',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.cyanAccent.shade700.withOpacity(.7),
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
        ],
      ),
    );
  }
}
