import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit(
      {this.flavor = 'Flavors',
      this.price = 'Prices',
      this.rating = 'Ratings',
      this.showFilter = false})
      : super(FilterHide());

  String flavor;
  String price;
  String rating;
  bool showFilter;

  // Toggles the filter
  void toggleFilter() {
    if (state is FilterShow) {
      flavor = 'Flavors';
      price = 'Prices';
      rating = 'Ratings';
      showFilter = false;
      emit(FilterHide());
    } else {
      showFilter = true;
      emit(FilterShow());
    }
  }

  // Resets filters to default
  void resetFilter() {
    flavor = 'Flavors';
    price = 'Prices';
    rating = 'Ratings';
    emit(FilterReset());
    emit(FilterShow());
  }

  void setFlavor(String f) {
    flavor = f;
    emit(FilterSelecting());
    emit(FilterShow());
  }

  void setPrice(String p) {
    price = p;
    emit(FilterSelecting());
    emit(FilterShow());
  }

  void setRating(String r) {
    // iceCreamData.iceCreamData;
    rating = r;
    emit(FilterSelecting());
    emit(FilterShow());
  }
}
