import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paribu_mobile/core/error/failure.dart';
import 'package:paribu_mobile/core/utils/ui_state.dart';
import 'package:paribu_mobile/feature/markets/data/dto/coin_dto.dart';

part 'market_state.freezed.dart';

@freezed
abstract class MarketState with _$MarketState {
  const factory MarketState({@Default([]) List<CoinDto> coins, @Default(UIStateStatus.idle) UIStateStatus coinStatus, Failure? failure}) =
      _MarketState;
}
