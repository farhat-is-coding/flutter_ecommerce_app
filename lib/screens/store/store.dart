// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screens/store/components/filters_row.dart';
import 'package:flutter_ecommerce_app/screens/store/components/icecream_card.dart';
import 'package:flutter_ecommerce_app/screens/store/components/search_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../icecreamdata.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Screen'),
      ),
      body: GestureDetector(
        onTap: () {
          // to dismiss the keyboard
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Column(
          children: [
            const SearchRow(),
            FiltersRow(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: AnimationLimiter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: width * 0.5, // width
                        mainAxisExtent: height * 0.3 // height
                        ),
                    itemCount: iceCreamData.length,
                    itemBuilder: (context, index) {
                      final iceCream = iceCreamData[index];
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                              child: IceCreamCard(iceCream: iceCream)),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
