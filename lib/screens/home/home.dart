import 'dart:ui';

// import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/screens/home/components/category_item.dart';
import 'package:flutter_ecommerce_app/screens/home/components/items_slider.dart';
import 'package:flutter_ecommerce_app/screens/home/components/showcase_slider.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.cyanAccent.shade700,
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              // get total items in cart
              final cart = context
                  .select((CartBloc cartBloc) => cartBloc.state.cartItems);
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  icon: badges.Badge(
                    position: badges.BadgePosition.topEnd(top: -15, end: -12),
                    badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.white,
                    ),
                    badgeContent: Text(
                      '${cart.length}',
                      style: TextStyle(
                        color: Colors.cyanAccent.shade700,
                      ),
                    ),
                    child: Icon(
                      Icons.shopping_cart,
                      color: const Color.fromARGB(255, 232, 229, 229),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'What\'s Cold?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.cyanAccent.shade700,
                ),
              ),
            ),
            const ShowcaseSlider(),
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return IceCreamItemsSlider();
              },
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.cyanAccent.shade700,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.cyanAccent.shade700,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 3,
                left: 3,
                bottom: 10,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/store');
                      },
                      child: const CategoryItem(
                        name: 'Strawberry',
                        image: 'assets/pattern/1.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/store');
                      },
                      child: const CategoryItem(
                        name: 'Coffee',
                        image: 'assets/pattern/10.png',
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/store');
                      },
                      child: const CategoryItem(
                        name: 'Mint',
                        image: 'assets/pattern/3.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ].animate(interval: 400.ms).fadeIn(duration: 300.ms),
        ),
      ),
    );
  }
}
