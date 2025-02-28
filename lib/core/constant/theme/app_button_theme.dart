import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';
import 'package:paribu_mobile/core/constant/theme/app_text_styles.dart';
import 'package:paribu_mobile/core/extension/num_extension.dart';
import 'package:paribu_mobile/core/helper/edge_insets_functions.dart';

class AppButtonTheme {
  static FilledButtonThemeData filledButtonTheme = FilledButtonThemeData(
    style: ButtonStyle(
      fixedSize: WidgetStatePropertyAll(Size(double.infinity, 48)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6.r)))),
      padding: WidgetStatePropertyAll(REdgeInsets.symmetric(horizontal: 16, vertical: 14)),
      backgroundColor: WidgetStatePropertyAll(AppColors.green),
    ),
  );

  static TextButtonThemeData textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      minimumSize: WidgetStatePropertyAll(Size(0, 30.h)),
      maximumSize: WidgetStatePropertyAll(Size(double.infinity, 60.h)),
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      textStyle: WidgetStatePropertyAll(AppTextStyles.px14w500),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}
