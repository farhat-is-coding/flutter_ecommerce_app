import 'package:flutter/material.dart';

class QuantityCounter extends StatelessWidget {
  const QuantityCounter({super.key});

  @override
  Widget build(BuildContext context) {
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
            // setState(() {
            //   if (counter > 1) {
            //     counter--;
            //   }
            // });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '10',
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
            // setState(() {
            //   if (counter < 3) {
            //     counter++;
            //   } else {
            //     _showTopSnackBar(
            //         context, 'You can buy 3 products or less!');
            //   }
            // });
          },
        ),
      ],
    );
  }
}
