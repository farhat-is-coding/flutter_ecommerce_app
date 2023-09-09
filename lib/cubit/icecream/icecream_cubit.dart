import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/cubit/filter/filter_cubit.dart';
import 'package:flutter_ecommerce_app/model/ice_cream.dart';

part 'icecream_state.dart';

class IcecreamCubit extends Cubit<IcecreamState> {
  IcecreamCubit()
      : super(IcecreamLoaded([
          IceCream(
              name: 'Ice Cream Dream',
              price: 4.99,
              quantity: 50,
              imgurl: 'assets/ice/15.png',
              iconurl: 'assets/pattern/1.png',
              description: 'Classic ice cream with a rich and creamy texture.',
              flavor: 'Strawberry',
              allergens: ['Milk'],
              rating: 4.8,
              bgColor: 0xffD2ADB4,
              textColor: 0xff5E4E31,
              btnColor: 0xff4B471A),
          IceCream(
              name: 'Minty Mint',
              price: 5.49,
              quantity: 40,
              imgurl: 'assets/ice/6.png',
              iconurl: 'assets/pattern/4.png',
              description: 'Ice Cream made by the finest Wilson & Sons.',
              flavor: 'Mint',
              allergens: ['Milk', 'Soy'],
              rating: 4.9,
              bgColor: 0xffE4ECEE,
              textColor: 0xff747272,
              btnColor: 0xffE0DFE0),
          IceCream(
              name: 'Strawberry Bliss',
              price: 4.75,
              quantity: 30,
              imgurl: 'assets/ice/13.png',
              iconurl: 'assets/pattern/9.png',
              description:
                  'Refreshing strawberry ice cream filled with real fruit chunks.',
              flavor: 'Strawberry',
              allergens: ['Milk'],
              rating: 4.7,
              bgColor: 0xffD9B6BA,
              textColor: 0xffBD2838,
              btnColor: 0xffBB2735),
          IceCream(
              name: "Mint Chip Euphoria",
              price: 5.99,
              quantity: 25,
              imgurl: 'assets/ice/1.png',
              iconurl: 'assets/pattern/12.png',
              description:
                  'Cool mint ice cream loaded with delightful chocolate chips.',
              flavor: 'Mint',
              allergens: ['Milk'],
              rating: 4.6,
              bgColor: 0xffECE2E3,
              textColor: 0xff104C6B,
              btnColor: 0xff0A4F70),
          IceCream(
              name: "Sexy Coffee",
              price: 6.25,
              quantity: 35,
              imgurl: 'assets/ice/7.png',
              iconurl: 'assets/pattern/11.png',
              description: 'Quality Coffee flavoured ice cream.',
              flavor: 'Coffee',
              allergens: ['Milk'],
              rating: 4.7,
              bgColor: 0xffE8E8E8,
              textColor: 0xff33595D,
              btnColor: 0xff224F55),
        ]));

  List<IceCream> iceCreamData = [
    IceCream(
        name: 'Ice Cream Dream',
        price: 4.99,
        quantity: 50,
        imgurl: 'assets/ice/15.png',
        iconurl: 'assets/pattern/1.png',
        description: 'Classic ice cream with a rich and creamy texture.',
        flavor: 'Strawberry',
        allergens: ['Milk'],
        rating: 4.8,
        bgColor: 0xffD2ADB4,
        textColor: 0xff5E4E31,
        btnColor: 0xff4B471A),
    IceCream(
        name: 'Minty Mint',
        price: 5.49,
        quantity: 40,
        imgurl: 'assets/ice/6.png',
        iconurl: 'assets/pattern/4.png',
        description: 'Ice Cream made by the finest Wilson & Sons.',
        flavor: 'Mint',
        allergens: ['Milk', 'Soy'],
        rating: 3.9,
        bgColor: 0xffE4ECEE,
        textColor: 0xff747272,
        btnColor: 0xffE0DFE0),
    IceCream(
        name: 'Strawberry Bliss',
        price: 4.75,
        quantity: 30,
        imgurl: 'assets/ice/13.png',
        iconurl: 'assets/pattern/9.png',
        description:
            'Refreshing strawberry ice cream filled with real fruit chunks.',
        flavor: 'Strawberry',
        allergens: ['Milk'],
        rating: 4.7,
        bgColor: 0xffD9B6BA,
        textColor: 0xffBD2838,
        btnColor: 0xffBB2735),
    IceCream(
        name: "Mint Chip Euphoria",
        price: 5.99,
        quantity: 25,
        imgurl: 'assets/ice/1.png',
        iconurl: 'assets/pattern/12.png',
        description:
            'Cool mint ice cream loaded with delightful chocolate chips.',
        flavor: 'Mint',
        allergens: ['Milk'],
        rating: 4.6,
        bgColor: 0xffECE2E3,
        textColor: 0xff104C6B,
        btnColor: 0xff0A4F70),
    IceCream(
        name: "Sexy Coffee",
        price: 6.25,
        quantity: 35,
        imgurl: 'assets/ice/7.png',
        iconurl: 'assets/pattern/11.png',
        description: 'Quality Coffee flavoured ice cream.',
        flavor: 'Coffee',
        allergens: ['Milk'],
        rating: 4.7,
        bgColor: 0xffE8E8E8,
        textColor: 0xff33595D,
        btnColor: 0xff224F55),
  ];

  void getIceCreamData(FilterCubit filterCubit) {
    emit(IcecreamLoading());

    //values for filters
    String flavor = filterCubit.flavor == "Flavors" ? "" : filterCubit.flavor;
    log(filterCubit.price);

    double rating = filterCubit.rating == "Ratings"
        ? 0.0
        : double.parse(filterCubit.rating);
    double price =
        filterCubit.price == "Prices" ? 0.0 : double.parse(filterCubit.price);

    List<IceCream> filteredData = iceCreamData.where((icecream) {
      return icecream.flavor.contains(flavor) &&
          icecream.rating > rating &&
          icecream.price > price;
    }).toList();

    Future.delayed(const Duration(seconds: 1), () {
      emit(IcecreamLoaded(filteredData));
    });
  }
}
