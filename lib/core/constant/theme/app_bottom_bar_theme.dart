import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_colors.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_text_styles.dart';

class AppBottomBarTheme {
  static BottomNavigationBarThemeData bottomBarTheme = BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedIconTheme: IconThemeData(color: AppColors.green),
    unselectedIconTheme: IconThemeData(color: AppColors.foregroundSecondary),
    showUnselectedLabels: true,
    unselectedLabelStyle: AppTextStyles.px10w400,
    selectedLabelStyle: AppTextStyles.px10w400,
    selectedItemColor: AppColors.foregroundPrimary,
    unselectedItemColor: AppColors.foregroundTertiary,
  );
}
