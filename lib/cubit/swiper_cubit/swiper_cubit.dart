import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'swiper_state.dart';

class SwiperCubit extends Cubit<SwiperState> {
  SwiperCubit() : super(SwiperInitial(idx: 0, showContent: true));

  void startSwiper(int newidx) {
    int oldIdx;

    if (state is Swiping) {
      oldIdx = (state as Swiping).idx;
    } else {
      oldIdx = 0; // Set a default value if it's not already Swiping
    }

    emit(Swiping(showContent: false, idx: oldIdx));

    if (state is Swiping) {
      Future.delayed(const Duration(milliseconds: 50), () {
        emit(SwiperInitial(showContent: true, idx: newidx));
      });
    }
  }
}
