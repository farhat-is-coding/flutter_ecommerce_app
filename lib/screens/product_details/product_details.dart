import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/model/ice_cream.dart';
import 'package:flutter_ecommerce_app/screens/product_details/components/cart_btn.dart';
import 'package:flutter_ecommerce_app/screens/product_details/components/image_header.dart';
import 'package:flutter_ecommerce_app/screens/product_details/components/info.dart';
import 'package:flutter_ecommerce_app/screens/product_details/components/quantity.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ProductDetailsScreen extends StatelessWidget {
  // final Map<String, dynamic> iceCream;

  const ProductDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final iceCream = ModalRoute.of(context)!.settings.arguments as IceCream;
    log('${iceCream.name}');

    // I am assuming, that cart button, quantity counter will use the BLoC pattern
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: AnimationConfiguration.synchronized(
        child: SlideAnimation(
          duration: Duration(milliseconds: 500),
          child: FadeInAnimation(
            duration: const Duration(milliseconds: 1500),
            delay: Duration(milliseconds: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IceCreamImageHeader(iceCreamImgUrl: iceCream.imgurl),
                IceCreamInfo(iceCream: iceCream),
                QuantityCounter(
                  iceCream: iceCream,
                ),
                CartButton(
                  iceCream: iceCream,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5,
                  ),
                  child: Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff4c5cbf)),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      child: const Text(
                        'View Cart',
                        style: TextStyle(
                            color: Color.fromARGB(255, 230, 233, 251)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
