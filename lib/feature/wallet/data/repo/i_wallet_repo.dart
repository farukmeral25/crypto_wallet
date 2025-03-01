import 'package:dartz/dartz.dart';
import 'package:paribu_mobile/core/error/failure.dart';
import 'package:paribu_mobile/feature/wallet/data/dto/wallet_dto.dart';

abstract class IWalletRepo {
  Future<Either<Failure, WalletDto>> createWallet(String name);
  Future<Either<Failure, void>> saveWallets(List<WalletDto> wallets);
  Future<Either<Failure, List<WalletDto>>> fetchWallets();
}
