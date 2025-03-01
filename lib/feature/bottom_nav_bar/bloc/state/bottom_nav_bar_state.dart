import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/data/enum/bottom_nav_bar_type.dart';

part 'bottom_nav_bar_state.freezed.dart';

@freezed
abstract class BottomNavBarState with _$BottomNavBarState {
  const factory BottomNavBarState({@Default(BottomNavBarType.markets) BottomNavBarType type}) = _BottomNavBarState;
}
