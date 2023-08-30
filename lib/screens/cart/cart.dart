import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/cart/components/card.dart';
import 'cart_list.dart';

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
      body: Column(children: [
        Container(
          height: height * 0.5,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: cartList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: ProductCard(
                    width: width,
                    index: index,
                    notifyParent: refresh,
                  ),
                );
              }),
        )
      ]),
    );
  }

  refresh() {
    setState(() {});
  }
}
