import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/bloc/state/bottom_nav_bar_state.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/data/enum/bottom_nav_bar_type.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState());

  void onTapItem(int index) {
    emit(state.copyWith(type: BottomNavBarType.values[index]));
  }
}
