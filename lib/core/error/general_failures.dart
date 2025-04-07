import 'package:crypto_wallet_mobile/core/error/failure.dart';

class ServiceFailure extends Failure {
  ServiceFailure({super.error});
}

class NullPointerFailure extends Failure {
  NullPointerFailure({super.error});
}
