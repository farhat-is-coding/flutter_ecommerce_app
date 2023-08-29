import 'package:flutter/material.dart';

class IceCreamInfo extends StatelessWidget {
  const IceCreamInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Strawberry Frosted Sprinkles',
                  style: TextStyle(
                    color: Color(0xff4c5cbf),
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ 2.99',
                      style: TextStyle(
                        color: Color(0xff4c5cbf),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '🔥 4.8',
                      style: TextStyle(
                        color: Color(0xff4c5cbf),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Ingredients: Sugar, Flour, Eggs, Milk, Butter, Baking Powder, Vanilla Extract, Salt, Strawberry, Sprinkles',
                  style: TextStyle(
                    color: Color(0xff4c5cbf),
                  ),
                ),
                Text(
                  'Description',
                  style: TextStyle(
                    color: Color(0xff4c5cbf),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah blah',
                  style: TextStyle(
                    color: Color(0xff4c5cbf),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                )
              ],
            ),
          )
          ;
  }
}