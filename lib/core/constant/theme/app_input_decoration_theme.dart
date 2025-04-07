import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_colors.dart';
import 'package:crypto_wallet_mobile/core/extension/num_extension.dart';

class AppInputDecorationTheme {
  static InputDecorationTheme inputTheme = InputDecorationTheme(
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.green), borderRadius: BorderRadius.circular(6.r)),
    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.foregroundStroke), borderRadius: BorderRadius.circular(6.r)),
  );
}
