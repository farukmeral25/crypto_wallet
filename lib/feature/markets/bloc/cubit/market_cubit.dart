import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/feature/markets/bloc/state/market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  MarketCubit() : super(MarketState());
}
