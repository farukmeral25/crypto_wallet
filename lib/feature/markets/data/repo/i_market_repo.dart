import 'package:dartz/dartz.dart';
import 'package:paribu_mobile/core/error/failure.dart';
import 'package:paribu_mobile/feature/markets/data/dto/coin_dto.dart';

abstract class IMarketRepo {
  Future<Either<Failure, List<CoinDto>>> fetchCoins();
}
