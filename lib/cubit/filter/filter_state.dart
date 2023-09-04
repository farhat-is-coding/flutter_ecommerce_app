part of 'filter_cubit.dart';

sealed class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

// Default state

final class FilterShow extends FilterState {

  FilterShow();
}

final class FilterHide extends FilterState {
  FilterHide();
}

final class FilterSelecting extends FilterState{
  FilterSelecting();
}

final class FilterReset extends FilterState{
  FilterReset();
}


// when i come from home screen categories
