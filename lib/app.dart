import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/app_constants.dart';
import 'package:paribu_mobile/core/constant/app_page_routes.dart';
import 'package:paribu_mobile/core/constant/theme/app_theme.dart';
import 'package:paribu_mobile/core/keys/app_keys.dart';
import 'package:paribu_mobile/core/utils/screen_size.dart';

class ParibuApp extends StatelessWidget {
  const ParibuApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize.init();
    return MaterialApp(
      theme: AppTheme.lightTheme,
      title: AppConstants.appName,
      navigatorKey: AppKeys.navigatorKey,
      scaffoldMessengerKey: AppKeys.scaffoldMessengerKey,
      onGenerateRoute: AppPageRoutes.onGenerateRoute,
    );
  }
}
