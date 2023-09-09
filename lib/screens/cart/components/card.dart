
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/model/cart.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductCard extends StatelessWidget {
  final Cart cartItem;
  final int index;
  // final Function() notifyParent;
  ProductCard({
    super.key,
    required this.cartItem,
    required this.index,
  });

  // double left = 0;
  int amount = 1;
  //amount aka quantity
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // var cart = BlocProvider.of<CartBloc>(context);
    // List iceCream = cart.state.cartItems;

    // final icecreamCubit =
    //     context.select((IcecreamCubit icecreamCubit) => icecreamCubit);

    // log(iceCream.first.quantity.toString());
    return Center(
      child: Container(
        width: width * 0.9,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Slidable(
          key: Key(index.toString()),
          endActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const BehindMotion(),

            // A pane can dismiss the Slidable.
            dismissible: DismissiblePane(onDismissed: () {
              context
                  .read<CartBloc>()
                  .add(DeleteIceCreamEvent(cartItem.iceCream));
            }),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                borderRadius: BorderRadius.circular(30),
                onPressed: (context) {
                  //remove item from cart list
                  // iceCream.remove(iceCream[widget.index]);

                  context
                      .read<CartBloc>()
                      .add(DeleteIceCreamEvent(cartItem.iceCream));

                  // widget.notifyParent();
                },
                backgroundColor: const Color.fromARGB(255, 99, 101, 241),
                foregroundColor: Colors.white,
                icon: Icons.remove_circle,
              ),
            ],
          ),
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('${cartItem.iceCream.imgurl}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${cartItem.iceCream.name}',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    //+ - buttons
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(
                                  RemoveIceCreamEvent(
                                    cartItem.iceCream,
                                  ),
                                );
                            // context.read<CartBloc>().add(RemoveIceCreamEvent(
                            //     iceCream[widget.index].iceCream));
                            // widget.notifyParent();
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 230, 233, 251),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.remove,
                              size: 15,
                              color: Color.fromARGB(255, 42, 48, 58),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text('${cartItem.quantity}'),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            context.read<CartBloc>().add(
                                  AddIceCreamEvent(
                                    cartItem.iceCream,
                                  ),
                                );
                            // widget.notifyParent();
                          },
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 230, 233, 251),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 15,
                              color: Color.fromARGB(255, 42, 48, 58),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        Text(
                          '${cartItem.iceCream.price}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
