part of 'swiper_cubit.dart';

sealed class SwiperState extends Equatable {
  const SwiperState();

  @override
  List<Object> get props => [];
}


class SwiperInitial extends SwiperState {
  final bool showContent;
  final int idx;

  SwiperInitial({required this.showContent, required this.idx});
}

class Swiping extends SwiperState {
  final bool showContent;
  final int idx;

  Swiping({required this.showContent, required this.idx});
}