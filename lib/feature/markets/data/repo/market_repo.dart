import 'package:dartz/dartz.dart';
import 'package:paribu_mobile/core/constant/api/api_service.dart';
import 'package:paribu_mobile/core/error/failure.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/utils/api_helper.dart';
import 'package:paribu_mobile/feature/markets/data/dto/coin_dto.dart';
import 'package:paribu_mobile/feature/markets/data/repo/i_market_repo.dart';

class MarketRepo implements IMarketRepo {
  @override
  Future<Either<Failure, List<CoinDto>>> fetchCoins() async {
    return await ApiHelper.request<List<CoinDto>>(apiCall: sl<ApiService>().fetchCoins);
  }
}
