import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/model/ice_cream.dart';

class IceCreamInfo extends StatelessWidget {
  final IceCream iceCream;
  const IceCreamInfo({super.key, required this.iceCream});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            iceCream.name,
            style: const TextStyle(
              color: Color(0xff6E7E98),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${iceCream.price}',
                style: const TextStyle(
                  color: Color(0xff6E7E98),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border_outlined,
                    color: Color(0xff6E7E98),
                    size: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${iceCream.rating}',
                    style: const TextStyle(
                      color: Color(0xff6E7E98),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            'Flavor: ${iceCream.flavor}',
            style: const TextStyle(
              color: Color(0xff6E7E98),
            ),
          ),
          Text(
            'Allergens: ${iceCream.allergens.toString().replaceAll('[', '').replaceAll(']', '')}',
            style: const TextStyle(
              color: Color(0xff6E7E98),
            ),
          ),
          const Text(
            'Description',
            style: TextStyle(
              color: Color(0xff6E7E98),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            iceCream.description,
            style: const TextStyle(
              color: Color(0xff6E7E98),
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
