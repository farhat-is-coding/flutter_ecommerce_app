import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_svg/svg.dart';

class IceCreamCard extends StatelessWidget {
  final Map<String, dynamic> iceCream;

  const IceCreamCard({super.key, required this.iceCream});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        left: 2,
        right: 2,
        bottom: 5,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/product_details', arguments: {
            'iceCream': iceCream,
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                iceCream['name'],
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey.shade800,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 3,
                  bottom: 3,
                ),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blueAccent.shade100,
                          ),
                        ).animate().fadeIn(duration: 1.seconds)),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        iceCream['imgurl'],
                        width: 140,
                        height: 140,
                      ).animate().shimmer(delay: 1.seconds),
                    ),
                  ],
                ),
              ),
              Text(
                '\$${iceCream['price'].toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
