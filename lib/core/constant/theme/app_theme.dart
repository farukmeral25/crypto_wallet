import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/theme/app_app_bar_theme.dart';
import 'package:paribu_mobile/core/constant/theme/app_bottom_bar_theme.dart';
import 'package:paribu_mobile/core/constant/theme/app_button_theme.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';
import 'package:paribu_mobile/core/constant/theme/app_list_tile_theme.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    //textTheme: AppTextTheme.textTheme,
    filledButtonTheme: AppButtonTheme.filledButtonTheme,
    textButtonTheme: AppButtonTheme.textButtonTheme,
    listTileTheme: AppListTileTheme.listTileTheme,
    appBarTheme: AppAppBarTheme.appBarTheme,
    bottomNavigationBarTheme: AppBottomBarTheme.bottomBarTheme,
    dividerTheme: DividerThemeData(color: Colors.red),
  );
}
