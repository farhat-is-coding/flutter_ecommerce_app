import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/cart/components/card.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('My Cart')),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProductCard(
                  width: width,
                ),
                ProductCard(
                  width: width,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
