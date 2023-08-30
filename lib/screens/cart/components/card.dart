import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/cart/cart_list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductCard extends StatefulWidget {
  final double width;
  final int index;
  final Function() notifyParent;
  const ProductCard(
      {super.key,
      required this.width,
      required this.index,
      required this.notifyParent});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double left = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width * 0.9,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Slidable(
          key: Key(widget.index.toString()),
          endActionPane: ActionPane(
            // A motion is a widget used to control how the pane animates.
            motion: const BehindMotion(),

            // A pane can dismiss the Slidable.
            dismissible: DismissiblePane(onDismissed: () {}),

            // All actions are defined in the children parameter.
            children: [
              // A SlidableAction can have an icon and/or a label.
              SlidableAction(
                borderRadius: BorderRadius.circular(30),
                onPressed: (context) {
                  //remove item from cart list
                  cartList.remove(cartList[widget.index]);
                  widget.notifyParent();
                },
                backgroundColor: Color.fromARGB(255, 99, 101, 241),
                foregroundColor: Colors.white,
                icon: Icons.remove_circle,
              ),
            ],
          ),
          child: Container(
            height: 100,
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('assets/ice/1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name ${widget.index}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    //+ - buttons
                    Row(
                      children: [
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFFAEB9E4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.remove, size: 15),
                        ),
                        SizedBox(width: 5),
                        Text('1'),
                        SizedBox(width: 5),
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xFFAEB9E4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.add, size: 15),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '\$',
                          style: TextStyle(
                            fontSize: 8,
                          ),
                        ),
                        Text(
                          '04.00',
                          style: TextStyle(
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
