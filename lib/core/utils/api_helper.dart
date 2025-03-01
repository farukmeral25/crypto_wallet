import 'package:dartz/dartz.dart';
import 'package:paribu_mobile/core/error/failure.dart';
import 'package:paribu_mobile/core/error/general_failures.dart';

abstract class ApiHelper {
  /// Request data from API
  static Future<Either<Failure, T>> request<T>({required Future<T> Function() apiCall}) async {
    try {
      final result = await apiCall();
      return Right(result);
    } catch (err) {
      return Left(ServiceFailure(error: "Error : $err"));
    }
  }
}
