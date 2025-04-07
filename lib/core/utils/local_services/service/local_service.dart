import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:crypto_wallet_mobile/core/error/failure.dart';
import 'package:crypto_wallet_mobile/core/error/general_failures.dart';
import 'package:crypto_wallet_mobile/core/utils/local_services/service/i_local_service.dart';
import 'package:crypto_wallet_mobile/core/utils/local_services/utils/param/local_key_param.dart';
import 'package:crypto_wallet_mobile/core/utils/local_services/utils/param/local_key_with_value_param.dart';

class LocalService implements ILocalService {
  final FlutterSecureStorage secureStorage;

  LocalService(this.secureStorage);
  @override
  Future<Either<Failure, String>> getDataFromKey(LocalKeyParam param) async {
    try {
      String? value = await secureStorage.read(key: param.key.value);
      if (value != null) {
        return Right(value);
      } else {
        return Left(NullPointerFailure());
      }
    } catch (e) {
      return Left(ServiceFailure(error: "Error : $e"));
    }
  }

  @override
  Future<Either<Failure, void>> removeDataFromKey(LocalKeyParam param) async {
    try {
      await secureStorage.delete(key: param.key.value);
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, void>> saveDataFromKey(LocalKeyWithValueParam param) async {
    try {
      await secureStorage.write(key: param.key.value, value: param.value);
      return const Right(null);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
}
