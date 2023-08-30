import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final double width;
  const ProductCard({super.key, required this.width});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double left = 0;
  @override
  Widget build(BuildContext context) {
    left = 0;
    return Stack(children: [
      Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(color: Colors.orange.shade200),
          )),
      Positioned(
        top: 0,
        left: 0,
        child: GestureDetector(
          // onHorizontalDragDown: (details) {
          //   setState(() {
          //     // left = details.localPosition.dx;
          //   });
          // },
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Center(
              child: Container(
                width: widget.width * 0.9,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100),
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        width: widget.width * 0.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset("assets/ice/1.png"),
                      ),
                      Container(
                        width: widget.width * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Ice Cream Name',
                                style: TextStyle(
                                  fontFamily: 'serif',
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_circle_rounded),
                                ),
                                Text('01'),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add_circle_sharp),
                                ),
                                const Text(
                                  '\$',
                                  style: TextStyle(fontSize: 8),
                                ),
                                const Text('04.00')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
