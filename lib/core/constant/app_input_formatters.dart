import 'package:flutter/services.dart';

class AppInputFormatters {
  static final AppInputFormatters _instance = AppInputFormatters._init();

  AppInputFormatters._init();

  factory AppInputFormatters() {
    return _instance;
  }

  final LengthLimitingTextInputFormatter _max60Characters = LengthLimitingTextInputFormatter(60);

  List<TextInputFormatter> get walletName {
    return [_max60Characters];
  }
}
