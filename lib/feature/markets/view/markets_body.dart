import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/core/extension/list_extension.dart';
import 'package:paribu_mobile/core/extension/num_extension.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/shared/app_sized_box.dart';
import 'package:paribu_mobile/core/shared/app_widget_state_builder.dart';
import 'package:paribu_mobile/feature/markets/bloc/cubit/market_cubit.dart';
import 'package:paribu_mobile/feature/markets/bloc/state/market_state.dart';
import 'package:paribu_mobile/feature/markets/view/widget/coin_chart.dart';
import 'package:paribu_mobile/feature/markets/view/widget/coin_info_bar.dart';

class MarketBody extends StatelessWidget {
  const MarketBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<MarketCubit>();
    return BlocBuilder<MarketCubit, MarketState>(
      bloc: cubit,
      builder:
          (context, state) => AppWidgetStateBuilder.none(
            status: state.coinStatus,
            failure: state.failure,
            builder: ListView.separated(
              itemBuilder: (context, index) {
                final coin = state.coins[index];
                return Column(
                  spacing: 8.h,
                  children: [CoinInfoBar(coin: coin), CoinChart(marketCapPrices: coin.marketCapPoints.getValueOrDefault, isUp: coin.isUp)],
                );
              },
              itemCount: state.coins.itemCount,
              separatorBuilder: (BuildContext context, int index) {
                return AppSizedBox.height(48);
              },
            ),
          ),
    );
  }
}
