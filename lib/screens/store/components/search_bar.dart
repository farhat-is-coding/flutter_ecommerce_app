import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/cubit/filter/filter_cubit.dart';
import 'package:flutter_ecommerce_app/cubit/icecream/icecream_cubit.dart';
import 'package:flutter_ecommerce_app/model/ice_cream.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 42,
              child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffaeb9e4),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffaeb9e4),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 111, 118, 147),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    isDense: true,
                    hintText: 'What are you looking for?',
                    hintStyle: const TextStyle(
                      color: Color.fromARGB(255, 111, 118, 147),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        //  go query
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 111, 118, 147),
                      ),
                      iconSize: 30,
                    ),
                  ),
                  onSubmitted: (value) {
                    //  go query
                  }),
            ),
          ),
        ),
        BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            final filterCubit = BlocProvider.of<FilterCubit>(context);
            final filterShow = filterCubit.showFilter;

            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 5.0,
                  bottom: 5.0,
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: !filterShow
                        ? const Color.fromARGB(255, 130, 149, 179)
                        : Colors.greenAccent.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: !filterShow
                        ? () {
                            context.read<FilterCubit>().toggleFilter();
                          }
                        : () {
                            FilterCubit filterCubit =
                                BlocProvider.of<FilterCubit>(context);
                            context
                                .read<IcecreamCubit>()
                                .getIceCreamData(filterCubit);
                          },
                    icon: Icon(
                      !filterShow ? Icons.filter_list : Icons.add_task,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        BlocBuilder<FilterCubit, FilterState>(
          builder: (context, state) {
            final filterCubit = BlocProvider.of<FilterCubit>(context);
            final filterShow = filterCubit.showFilter;
            bool isFilterSelected = false;
            if (filterCubit.flavor == "Flavors" &&
                filterCubit.price == "Prices" &&
                filterCubit.rating == "Ratings") {
              isFilterSelected = false;
            } else {
              isFilterSelected = true;
            }

            return filterShow
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 5.0,
                        bottom: 5.0,
                      ),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.redAccent.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: isFilterSelected
                              ? () {
                                  context.read<FilterCubit>().resetFilter();

                                  // FilterCubit filterCubit =
                                  //     BlocProvider.of<FilterCubit>(context);
                                  context
                                      .read<IcecreamCubit>()
                                      .getIceCreamData(filterCubit);
                                }
                              : () {
                                  // context.read<FilterCubit>().resetFilter();

                                  context.read<FilterCubit>().toggleFilter();
                                },
                          icon: Icon(
                            isFilterSelected ? Icons.refresh : Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ).animate().fadeIn(),
                  )
                : Container();
          },
        ),
      ],
    );
  }
}
