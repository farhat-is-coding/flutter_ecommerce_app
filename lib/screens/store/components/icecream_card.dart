import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IceCreamCard extends StatelessWidget {
  final Map<String, dynamic> iceCream;

  IceCreamCard({required this.iceCream});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 3, left: 3, right: 3, bottom: 3),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/product_details');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(iceCream['name'],
                  style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffe6e6e6))),
                  ),
                  
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      iceCream['imgurl'],
                      width: 140,
                      height: 140,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$${iceCream['price'].toStringAsFixed(2)}',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
