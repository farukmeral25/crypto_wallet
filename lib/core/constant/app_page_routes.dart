import 'package:flutter/material.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/view/page/bottom_nav_bar_page.dart';
import 'package:paribu_mobile/feature/wallet/view/page/wallet_manage_page.dart';

enum AppPageRoutes {
  bottomNavBar(page: BottomNavBarPage()),
  walletManage(page: WalletManagePage());

  final Widget page;

  const AppPageRoutes({required this.page});

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final AppPageRoutes route = AppPageRoutes.values.singleWhere((element) => element.value == settings.name);

    return route.navigate(settings);
  }
}

extension AppPageRoutesExtension on AppPageRoutes {
  String get value {
    switch (this) {
      case AppPageRoutes.bottomNavBar:
        return '/';

      default:
        return name;
    }
  }

  Route<dynamic> navigate(RouteSettings settings) {
    switch (this) {
      default:
        return MaterialPageRoute(builder: (_) => page, settings: settings);
    }
  }
}
