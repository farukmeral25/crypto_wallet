import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/app_constants.dart';
import 'package:crypto_wallet_mobile/core/constant/app_page_routes.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_theme.dart';
import 'package:crypto_wallet_mobile/core/keys/app_keys.dart';
import 'package:crypto_wallet_mobile/core/utils/screen_size.dart';

class CryptoWalletApp extends StatelessWidget {
  const CryptoWalletApp({super.key});

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
