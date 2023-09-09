import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/model/ice_cream.dart';

class QuantityCounter extends StatelessWidget {
  final IceCream iceCream;
  const QuantityCounter({super.key, required this.iceCream});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartBloc>().state.cartItems;
    //get index of iceCream in cart
    bool found = false;
    int i = -1;
    int quantity = 0;
    if (cart.isNotEmpty) {
      for (var item in cart) {
        i++;
        if (item.iceCream == iceCream) {
          found = true;
          break;
        }
      }
      quantity = cart[i].quantity;
    }

    log("found: ${found}");
    log("index: ${i}");

    // getting value of quantity
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(6)),
            minimumSize: MaterialStateProperty.all(Size.zero),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Color.fromARGB(255, 230, 233, 251)),
          ),
          icon: const Icon(
            Icons.remove,
            color: Color(0xff4c5cbf),
          ),
          onPressed: () {
            // context.read<CartBloc>().add(RemoveIceCreamEvent(iceCream));
            BlocProvider.of<CartBloc>(context)
                .add(RemoveIceCreamEvent(iceCream));
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            quantity.toString(),
            style: TextStyle(
              color: Color(0xff4c5cbf),
              fontSize: 14,
            ),
          ),
        ),
        IconButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(6)),
            minimumSize: MaterialStateProperty.all(Size.zero),
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => Color.fromARGB(255, 230, 233, 251)),
          ),
          icon: const Icon(
            Icons.add,
            color: Color(0xff4c5cbf),
          ),
          onPressed: () {
            // context.watch<CartBloc>().add(AddIceCreamEvent(iceCream));
            BlocProvider.of<CartBloc>(context).add(AddIceCreamEvent(iceCream));
          },
        ),
      ],
    );
  }
}
