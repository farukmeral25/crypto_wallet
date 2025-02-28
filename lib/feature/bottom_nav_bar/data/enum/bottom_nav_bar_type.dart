import 'package:flutter/widgets.dart';
import 'package:paribu_mobile/core/constant/app_strings.dart';
import 'package:paribu_mobile/core/constant/asset_path.dart';
import 'package:paribu_mobile/feature/charts/view/charts_body.dart';
import 'package:paribu_mobile/feature/wallet/view/wallet_body.dart';

enum BottomNavBarType { charts, wallet }

extension BottomNavBarTypeExtension on BottomNavBarType {
  String get icon {
    switch (this) {
      case BottomNavBarType.charts:
        return AssetPaths().chart;
      case BottomNavBarType.wallet:
        return AssetPaths().wallet;
    }
  }

  String get label {
    switch (this) {
      case BottomNavBarType.charts:
        return AppStrings.markets;
      case BottomNavBarType.wallet:
        return AppStrings.wallet;
    }
  }

  Widget get body {
    switch (this) {
      case BottomNavBarType.charts:
        return ChartsBody();
      case BottomNavBarType.wallet:
        return WalletBody();
    }
  }
}
