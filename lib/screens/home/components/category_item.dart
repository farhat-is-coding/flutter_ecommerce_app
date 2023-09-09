import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.only(bottom: 3, right: 5, top: 3),
      height: height * 0.25,
      width: width * 0.475,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(12),
        color: const Color.fromARGB(255, 111, 118, 147),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SizedBox(
              width: width,
              height: height * 0.20,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
