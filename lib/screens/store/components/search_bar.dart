import 'package:flutter/material.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: width * 0.8,
            height: height * 0.05,
            child: const TextField(
              decoration: InputDecoration(
                // border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 10), //Change this value to custom as you like
                isDense: true, // and add this line
                hintText: 'what you are looking for',
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            onPressed: () {
              // setState(() {
              //   showFilter = !showFilter;
              // });
            },
            icon: Icon(Icons.filter_list),
          ),
        ),
      ],
    );
  }
}
