import 'package:flutter/material.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/view/page/bottom_nav_bar_page.dart';
import 'package:paribu_mobile/feature/wallet/view/page/create_wallet_page.dart';
import 'package:paribu_mobile/feature/wallet/view/page/enter_pin_code_page.dart';
import 'package:paribu_mobile/feature/wallet/view/page/wallet_manage_page.dart';

enum AppPageRoutes {
  bottomNavBar(page: BottomNavBarPage()),
  walletManage(page: WalletManagePage()),
  createWallet(page: CreateWalletPage()),
  enterPinCode(page: EnterPinCodePage());

  final Widget page;

  const AppPageRoutes({required this.page});

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final AppPageRoutes route = AppPageRoutes.values.singleWhere((element) => element.value == settings.name);

    return route.navigate(settings, route.isModal);
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

  bool get isModal {
    switch (this) {
      case AppPageRoutes.createWallet:
      case AppPageRoutes.enterPinCode:
        return true;

      default:
        return false;
    }
  }

  Route<dynamic> navigate(RouteSettings settings, bool isModalBottomSheet) {
    switch (this) {
      default:
        return isModalBottomSheet
            ? ModalBottomSheetRoute(builder: (_) => page, settings: settings, isScrollControlled: true, useSafeArea: true)
            : MaterialPageRoute(builder: (_) => page, settings: settings);
    }
  }
}
