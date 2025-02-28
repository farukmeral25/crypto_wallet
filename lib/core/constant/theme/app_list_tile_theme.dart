import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';
import 'package:paribu_mobile/core/constant/theme/app_text_styles.dart';

class AppListTileTheme {
  static ListTileThemeData listTileTheme = ListTileThemeData(
    titleTextStyle: AppTextStyles.px14w500,
    subtitleTextStyle: AppTextStyles.px10w400.copyWith(color: AppColors.foregroundTertiary),
  );
}
