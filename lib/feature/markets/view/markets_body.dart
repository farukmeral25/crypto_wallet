import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/feature/markets/bloc/cubit/market_cubit.dart';
import 'package:paribu_mobile/feature/markets/bloc/state/market_state.dart';

class MarketBody extends StatelessWidget {
  const MarketBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<MarketCubit>();
    return BlocBuilder<MarketCubit, MarketState>(
      bloc: cubit,
      builder: (context, state) => ListView.builder(itemBuilder: (context, index) => Text("Chart: $index"), itemCount: 10),
    );
  }
}
