import 'package:dio/dio.dart';
import 'package:paribu_mobile/core/constant/api/app_endpoint.dart';
import 'package:paribu_mobile/feature/markets/data/dto/coin_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  //!Video Api's
  @GET(AppEndpoint.coinMarkets)
  Future<List<CoinDto>> fetchCoins();
}
