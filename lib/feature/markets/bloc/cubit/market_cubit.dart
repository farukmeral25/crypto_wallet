import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/utils/ui_state.dart';
import 'package:paribu_mobile/feature/markets/bloc/state/market_state.dart';
import 'package:paribu_mobile/feature/markets/data/repo/i_market_repo.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(MarketState());

  final _marketRepo = sl<IMarketRepo>();

  Future<void> initialize() async {
    emit(state.copyWith(coinStatus: UIStateStatus.loading));
    final fetchCoinsEither = await _marketRepo.fetchCoins();
    fetchCoinsEither.fold(
      (failure) => emit(state.copyWith(failure: failure, coinStatus: UIStateStatus.error)),
      (data) => emit(state.copyWith(coinStatus: UIStateStatus.success, coins: data)),
    );
  }
}
