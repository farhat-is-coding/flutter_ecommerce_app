import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_ecommerce_app/bloc/cart/cart_bloc.dart';
import 'package:flutter_ecommerce_app/cubit/filter/filter_cubit.dart';
// import 'package:flutter_ecommerce_app/cubit/icecream/icecream_cubit.dart';

class FiltersRow extends StatelessWidget {
  FiltersRow({super.key});

  final List<String> flavors = ['Flavors', 'Strawberry', 'Mint', 'Coffee'];
  final List<String> ratings = ['Ratings', '1', '2', '3', '4', '5'];
  final List<String> prices = ['Prices', '3', '4', '5', '6'];

  // Will decide after making its controller

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        final filterCubit = BlocProvider.of<FilterCubit>(context);
        final flavor = filterCubit.flavor;
        final rating = filterCubit.rating;
        final price = filterCubit.price;
        // log(filterCubit.state.toString());
        // log(flavor);
        // log(rating);
        // log(price);

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
              value: flavor,
              onChanged: (value) {
                log('selected value is $value');
                context.read<FilterCubit>().setFlavor(value!);
                // context.read<IcecreamCubit>().getIceCreamData(filterCubit);
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
                  color: const Color.fromARGB(0, 245, 245, 245),
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
              value: price,
              onChanged: (value) {
                context.read<FilterCubit>().setPrice(value!);
                // context.read<IcecreamCubit>().getIceCreamData(filterCubit);

                // context.read<CartBloc>().cartItems.length;
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
                  color: const Color.fromARGB(0, 245, 245, 245),
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
              value: rating,
              onChanged: (value) {
                context.read<FilterCubit>().setRating(value!);
                // context.read<IcecreamCubit>().getIceCreamData(filterCubit);
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
                  color: const Color.fromARGB(0, 245, 245, 245),
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
      },
    );
  }
}
