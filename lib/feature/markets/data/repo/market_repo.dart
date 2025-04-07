import 'package:dartz/dartz.dart';
import 'package:crypto_wallet_mobile/core/constant/api/api_service.dart';
import 'package:crypto_wallet_mobile/core/error/failure.dart';
import 'package:crypto_wallet_mobile/core/extension/date_extension.dart';
import 'package:crypto_wallet_mobile/core/init/injection_container.dart';
import 'package:crypto_wallet_mobile/core/utils/api_helper.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/dto/coin_dto.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/dto/price_dto.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/param/chart_param.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/param/coin_param.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/repo/i_market_repo.dart';

class MarketRepo implements IMarketRepo {
  @override
  Future<Either<Failure, List<CoinDto>>> fetchCoins() async {
    return await ApiHelper.request<List<CoinDto>>(apiCall: () => sl<ApiService>().fetchCoins(CoinParam()));
  }

  @override
  Future<Either<Failure, PriceDto>> fetchMarketChart(String id) async {
    return await ApiHelper.request<PriceDto>(
      apiCall: () => sl<ApiService>().fetchMarketChart(
        id,
        ChartParam(from: DateTime.now().subtract(Duration(days: 1)).timeStamp, to: DateTime.now().timeStamp),
      ),
    );
  }
}
