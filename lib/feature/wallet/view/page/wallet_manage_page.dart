import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/app_strings.dart';
import 'package:paribu_mobile/core/constant/asset_path.dart';
import 'package:paribu_mobile/core/extension/widget_extension.dart';
import 'package:paribu_mobile/core/functions/app_functions.dart';
import 'package:paribu_mobile/core/helper/edge_insets_functions.dart';
import 'package:paribu_mobile/core/shared/app_button.dart';
import 'package:paribu_mobile/core/shared/app_icon.dart';
import 'package:paribu_mobile/core/shared/app_sized_box.dart';
import 'package:paribu_mobile/core/utils/route_manager.dart';

class WalletManagePage extends StatelessWidget {
  const WalletManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: REdgeInsets.all(8),
          child: GestureDetector(onTap: RouteManager().pop, child: AppIcon(assetPath: AssetPaths().arrowLeft)),
        ),
        title: Text("Wallet A"),
      ),
      body: CustomScrollView(
        slivers: [
          Column(
            children: [
              _buildListTile(title: AppStrings.publicAddress, subtitle: "0xabcd1234567bd1b76A09Cf2817F456a89C9FF1bb"),
              Divider(indent: 16, endIndent: 16, height: 1),
              _buildListTile(
                title: AppStrings.mnemonicPhrase,
                subtitle: "apple, wall, sunset, ocean, moon, tree, garden, river, shadow, bridge, light, dream",
              ),
            ],
          ).toSliver,
          AppSizedBox.height(48).toSliver,
          AppButton.filled(
            AppStrings.exportWallet,
            onTap: () {
              //TODO: Export Wallet
            },
          ).toSliverPadding(padding: REdgeInsets.symmetric(horizontal: 16)),
          AppButton.text(
            AppStrings.web3connect,
            onTap: () {
              //TODO: Web3Connect
            },
          ).toSliverPadding(padding: REdgeInsets.symmetric(horizontal: 16)),
        ],
      ),
    );
  }

  Widget _buildListTile({required String title, required String subtitle}) => ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: GestureDetector(onTap: () => AppFunctions.copy(subtitle), child: AppIcon(assetPath: AssetPaths().copy)),
  );
}
