import 'dart:ui';

// import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/home/components/category_item.dart';
import 'package:flutter_ecommerce_app/screens/home/components/items_slider.dart';
import 'package:flutter_ecommerce_app/screens/home/components/showcase_slider.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Whats Cold?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.cyanAccent.shade700,
              ),
            ),
            const ShowcaseSlider(),
            const IceCreamItemsSlider(),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.cyanAccent.shade700,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/store');
                  },
                  child: CategoryItem(
                    name: 'baaten',
                    image: 'assets/icon3.png',
                  ),
                ),
                CategoryItem(
                  name: 'cant think of shi',
                  image: 'assets/success.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
