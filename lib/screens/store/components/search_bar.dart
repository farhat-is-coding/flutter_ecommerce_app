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
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent.shade200,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueAccent.shade200,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 7),
                isDense: true,
                hintText: 'What are you looking for?',
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            right: 5.0,
            bottom: 5.0,
          ),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.blueAccent.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              onPressed: () {
                // setState(() {
                //   showFilter = !showFilter;
                // });
              },
              icon: const Icon(
                Icons.filter_list,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
