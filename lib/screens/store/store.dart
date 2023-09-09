// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/cubit/filter/filter_cubit.dart';
import 'package:flutter_ecommerce_app/cubit/icecream/icecream_cubit.dart';
import 'package:flutter_ecommerce_app/screens/store/components/filters_row.dart';
import 'package:flutter_ecommerce_app/screens/store/components/icecream_card.dart';
import 'package:flutter_ecommerce_app/screens/store/components/search_bar.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import '../icecreamdata.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  // bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Store Screen',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff6E7E98),
      ),
      body: GestureDetector(
        onTap: () {
          // to dismiss the keyboard
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            //  This builder only gets called when the FilterCubit.state is updated.
            final filterCubit = BlocProvider.of<FilterCubit>(context);
            final filterShow = filterCubit.showFilter;
            // Access the flavor variable from the FilterCubit instance
            // final stateInfo = filterCubit.state.toString();
            // final flavor = filterCubit.flavor;

            return Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                const SearchRow(),
                if (filterShow) FiltersRow().animate().fadeIn().scale(),
                // else Container(),
                const SizedBox(
                  height: 10,
                ),
                // Text("${filterShow}"),
                // Text("${flavor2}"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: BlocBuilder<IcecreamCubit, IcecreamState>(
                      builder: (context, state) {
                        if (state is IcecreamLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is IcecreamLoaded) {
                          final iceCreamData = state.iceCreamData;
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: width * 0.5, // width
                              mainAxisExtent: height * 0.25, // height
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
                                    child: IceCreamCard(iceCream: iceCream),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const SizedBox
                              .shrink(); // Return an empty widget for other states
                        }
                      },
                    ),

                    // : Center(child:CircularProgressIndicator()),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
