import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/product_details/components/cart_btn.dart';
import 'package:flutter_ecommerce_app/screens/product_details/components/image_header.dart';
import 'package:flutter_ecommerce_app/screens/product_details/components/info.dart';
import 'package:flutter_ecommerce_app/screens/product_details/components/quantity.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // I am assuming, that cart button, quantity counter will use the BLoC pattern
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IceCreamImageHeader(),
          IceCreamInfo(),
          QuantityCounter(),
          CartButton(),
          //button to view cart
          //will be replaced later
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            child: const Text('View Cart'),
          ),
        ],
      ),
    );
  }
}
