import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_colors.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_text_styles.dart';
import 'package:crypto_wallet_mobile/core/helper/edge_insets_functions.dart';

class AppListTileTheme {
  static ListTileThemeData listTileTheme = ListTileThemeData(
    titleTextStyle: AppTextStyles.px14w500,
    subtitleTextStyle: AppTextStyles.px10w400.copyWith(color: AppColors.foregroundTertiary),
    contentPadding: REdgeInsets.symmetric(horizontal: 16),
    visualDensity: VisualDensity(vertical: -4),
  );
}
