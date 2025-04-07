import 'package:dio/dio.dart';
import 'package:crypto_wallet_mobile/core/constant/api/app_endpoint.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/dto/coin_dto.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/dto/price_dto.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/param/chart_param.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/param/coin_param.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  //!Video Api's
  @GET(AppEndpoint.coinMarkets)
  Future<List<CoinDto>> fetchCoins(@Queries() CoinParam param);

  @GET(AppEndpoint.marketChart)
  Future<PriceDto> fetchMarketChart(@Path("id") String value, @Queries() ChartParam param);
}
