import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/model/ice_cream.dart';

class CartButton extends StatelessWidget {
  final IceCream iceCream;
  const CartButton({super.key, required this.iceCream});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: SizedBox(
        width: width * 0.5,
        height: height * 0.08,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 230, 233, 251)),
          ),
          onPressed: () {
            //add to cart
            BlocProvider.of<CartBloc>(context).add(AddIceCreamEvent(iceCream));
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_cart,
                color: Color(0xff6E7E98),
              ),
              Text(
                'Add to Cart',
                style: TextStyle(color: Color(0xff6E7E98),),
              ),
            ],
          ),
        ).animate().shimmer(
              delay: 2.seconds,
              duration: 1.seconds,
            ),
      ),
    );
  }
}
