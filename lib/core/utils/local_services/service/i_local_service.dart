import 'package:dartz/dartz.dart';
import 'package:crypto_wallet_mobile/core/error/failure.dart';
import 'package:crypto_wallet_mobile/core/utils/local_services/utils/param/local_key_param.dart';
import 'package:crypto_wallet_mobile/core/utils/local_services/utils/param/local_key_with_value_param.dart';

abstract class ILocalService {
  /// [LocalKeyParam] is a class that contains the key value to be used in the local service.
  /// GetDataFromKey method is used to get data from local service.
  Future<Either<Failure, String>> getDataFromKey(LocalKeyParam param);

  /// [LocalKeyWithValueParam] is a class that contains the key value and the value to be used in the local service.
  /// Remove Data From Key method is used to remove data from local service.
  Future<Either<Failure, void>> removeDataFromKey(LocalKeyParam param);

  /// [LocalKeyWithValueParam] is a class that contains the key value and the value to be used in the local service.
  /// SaveDateFromKey method is used to save data to local service.
  Future<Either<Failure, void>> saveDataFromKey(LocalKeyWithValueParam param);
}
