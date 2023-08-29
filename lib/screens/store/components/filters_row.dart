import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class FiltersRow extends StatelessWidget {
  FiltersRow({super.key});

  // final List<String> items = [
  //   'Item1',
  //   'Item2',
  //   'Item3',
  //   'Item4',
  //   'Item5',
  //   'Item6',
  //   'Item7',
  //   'Item8',
  // ];

  final List<String> flavors = [
    'Flavors',
    'Strawberry',
    'Mint',
    'Coffee'
  ];
  final List<String> ratings = [
    'Ratings',
    '1',
    '2',
    '3',
    '4',
    '5'
  ];
  final List<String> prices = [
    'Prices',
    'Low to High',
    'High to Low'
  ];

  String? selectedValue;

  // Will decide after making its controller 

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        DropdownButton2<String>(
          underline: Container(),
          isExpanded: true,
          hint: const Row(
            children: [
              Expanded(
                child: Text(
                  'Flavors',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: flavors
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 30, 31, 46),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            if(value == 'Flavors'){
              value = '';
            }
            // setState(() {
            //   selectedValue = value;
            // });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: width * 0.3,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Color.fromARGB(0, 245, 245, 245),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey.shade200,
            ),
            // offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        
        ),
        DropdownButton2<String>(
          underline: Container(),
          isExpanded: true,
          hint: const Row(
            children: [
              Expanded(
                child: Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: prices
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 30, 31, 46),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            // setState(() {
            //   selectedValue = value;
            // });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: width * 0.3,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Color.fromARGB(0, 245, 245, 245),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: Colors.grey.shade200,
            ),
            // offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
        DropdownButton2<String>(
          underline: Container(),
          isExpanded: true,
          hint: const Row(
            children: [
              Expanded(
                child: Text(
                  'Ratings',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          items: ratings
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 30, 31, 46),
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            // setState(() {
            //   selectedValue = value;
            // });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: width * 0.3,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.black26,
              ),
              color: Color.fromARGB(0, 245, 245, 245),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: width * 0.4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            // offset: const Offset(-20, 0),
            scrollbarTheme: ScrollbarThemeData(
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(6),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ],
    );
  }
}
