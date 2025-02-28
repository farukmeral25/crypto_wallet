import 'package:paribu_mobile/core/constant/asset_path.dart';

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
        return "Markets";
      case BottomNavBarType.wallet:
        return "Wallet";
    }
  }
}
