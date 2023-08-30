import 'package:flutter/material.dart';
import '../../icecreamdata.dart';

class ShowcaseSliderCard extends StatelessWidget {
  final int index;
  const ShowcaseSliderCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25.0, top: 5, bottom: 20),
            child: SizedBox(
              width: width * 0.375,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          '${iceCreamData[index]['iconurl']}',
                        ),
                      ),
                      Text(
                        '${iceCreamData[index]['name']}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xff4c5cbf),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/store');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 8),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Color.fromARGB(255, 230, 233, 251)),
                      width: width * 0.3,
                      child: const Center(
                        child: Text(
                          'Explore',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff4c5cbf),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(20, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                '${iceCreamData[index]['imgurl']}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
