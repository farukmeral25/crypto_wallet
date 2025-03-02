import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/core/extension/generic_extension.dart';
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
    fetchCoinsEither.fold((failure) => emit(state.copyWith(failure: failure, coinStatus: UIStateStatus.error)), (data) {
      emit(state.copyWith(coinStatus: UIStateStatus.success, coins: data));
      fetchCoinsMarketChart();
    });
  }

  Future<void> fetchCoinsMarketChart() async {
    for (var coin in state.coins) {
      await fetchCoinChart(coin.id);
    }
  }

  Future<void> fetchCoinChart(String id) async {
    final chartEither = await _marketRepo.fetchMarketChart(id);
    chartEither.fold(
      (failure) {
        failure.showSnackBar();
      },
      (data) {
        final updatedCoins =
            state.coins.map((coin) {
              if (coin.id.isEquals(id)) {
                return coin.copyWith(marketCapPrices: data.marketCaps);
              }
              return coin;
            }).toList();

        emit(state.copyWith(coins: updatedCoins));
      },
    );
  }
}
