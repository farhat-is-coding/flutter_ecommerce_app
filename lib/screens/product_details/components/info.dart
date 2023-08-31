import 'package:flutter/material.dart';

class IceCreamInfo extends StatelessWidget {
  final Map<String, dynamic> iceCream;
  const IceCreamInfo({super.key, required this.iceCream});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            iceCream['name'],
            style: const TextStyle(
              color: Color(0xff4c5cbf),
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${iceCream['price']}',
                style: const TextStyle(
                  color: Color(0xff4c5cbf),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '🔥 ${iceCream['rating']}',
                style: const TextStyle(
                  color: Color(0xff4c5cbf),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            'Flavor: ${iceCream['flavor']}',
            style: const TextStyle(
              color: Color(0xff4c5cbf),
            ),
          ),
          Text(
            'Allergens: ${iceCream['allergens'].toString().replaceAll('[', '').replaceAll(']', '')}',
            style: const TextStyle(
              color: Color(0xff4c5cbf),
            ),
          ),
          const Text(
            'Description',
            style: TextStyle(
              color: Color(0xff4c5cbf),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            iceCream['description'],
            style: const TextStyle(
              color: Color(0xff4c5cbf),
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
