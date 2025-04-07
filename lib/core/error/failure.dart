import 'package:crypto_wallet_mobile/core/shared/app_snackbar/snackbar.dart';

abstract class Failure {
  final String? error;

  Failure({this.error});

  String get message => error ?? toString();

  void showSnackBar() => AppSnackBar.show(message);
}
