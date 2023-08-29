import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/store/components/filters_row.dart';
import 'package:flutter_ecommerce_app/screens/store/components/icecream_card.dart';
import 'package:flutter_ecommerce_app/screens/store/components/search_bar.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  
  // will shift to state file after incorporating BLoC
  final iceCreamData = [
    {
      "name": "Ice Cream Dream",
      "price": 4.99,
      "quantity": 50,
      "imgurl": "assets/ice/15.png",
      "iconurl": "assets/pattern/1.png",
      "description": "Classic ice cream with a rich and creamy texture.",
      "flavor": "Strawberry",
      "allergens": ["Milk"],
      "rating": 4.8
    },
    {
      "name": "Musty Mint",
      "price": 5.49,
      "quantity": 40,
      "imgurl": "assets/ice/6.png",
      "iconurl": "assets/pattern/4.png",
      "description": "Ice Cream made by the finest Wilson & Sons.",
      "flavor": "Mint",
      "allergens": ["Milk", "Soy"],
      "rating": 4.9
    },
    {
      "name": "Strawberry Bliss",
      "price": 4.75,
      "quantity": 30,
      "imgurl": "assets/ice/13.png",
      "iconurl": "assets/pattern/9.png",
      "description":
          "Refreshing strawberry ice cream filled with real fruit chunks.",
      "flavor": "Strawberry",
      "allergens": ["Milk"],
      "rating": 4.7
    },
    {
      "name": "Mint Chip Euphoria",
      "price": 5.99,
      "quantity": 25,
      "imgurl": "assets/ice/1.png",
      "iconurl": "assets/pattern/12.png",
      "description":
          "Cool mint ice cream loaded with delightful chocolate chips.",
      "flavor": "Mint",
      "allergens": ["Milk"],
      "rating": 4.6
    },
    {
      "name": "Sexy Coffee",
      "price": 6.25,
      "quantity": 35,
      "imgurl": "assets/ice/7.png",
      "iconurl": "assets/pattern/11.png",
      "description": "Quality Coffee flavoured ice cream.",
      "flavor": "Coffee",
      "allergens": ["Milk"],
      "rating": 4.7
    }
  ];

  
  bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Screen'),
      ),
      body: Column(
        children: [
         
         SearchRow(),

         FiltersRow(),

          // showFilter
          //     ? 
          //     : Container(),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: width * 0.5, // width
                mainAxisExtent: height * 0.279 // height
              ),
              itemCount: iceCreamData.length,
              itemBuilder: (context, index) {
                final iceCream = iceCreamData[index];
                return IceCreamCard(iceCream: iceCream);
              },
            ),
          ),

        ],
      ),
    );
  }
}

