import 'package:flutter/services.dart';

class AppInputFormatters {
  static final AppInputFormatters _instance = AppInputFormatters._init();

  AppInputFormatters._init();

  factory AppInputFormatters() {
    return _instance;
  }

  final LengthLimitingTextInputFormatter _max60Characters = LengthLimitingTextInputFormatter(60);
  final LengthLimitingTextInputFormatter _otpLength = LengthLimitingTextInputFormatter(1);

  List<TextInputFormatter> get walletName {
    return [_max60Characters];
  }

  List<TextInputFormatter> get otp {
    return [_otpLength];
  }
}
