import 'package:dartz/dartz.dart';
import 'package:crypto_wallet_mobile/core/error/failure.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/dto/coin_dto.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/dto/price_dto.dart';

abstract class IMarketRepo {
  Future<Either<Failure, List<CoinDto>>> fetchCoins();
  Future<Either<Failure, PriceDto>> fetchMarketChart(String id);
}
