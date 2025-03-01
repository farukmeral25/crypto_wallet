import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/app_page_routes.dart';
import 'package:paribu_mobile/core/constant/app_strings.dart';
import 'package:paribu_mobile/core/constant/asset_path.dart';
import 'package:paribu_mobile/core/extension/widget_extension.dart';
import 'package:paribu_mobile/core/functions/app_functions.dart';
import 'package:paribu_mobile/core/helper/edge_insets_functions.dart';
import 'package:paribu_mobile/core/shared/app_button.dart';
import 'package:paribu_mobile/core/shared/app_icon.dart';
import 'package:paribu_mobile/core/shared/app_sized_box.dart';
import 'package:paribu_mobile/core/utils/route_manager.dart';
import 'package:paribu_mobile/feature/wallet/data/dto/wallet_dto.dart';

class WalletManagePage extends StatelessWidget {
  const WalletManagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final wallet = ModalRoute.of(context)?.settings.arguments as WalletDto;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: REdgeInsets.all(8),
          child: GestureDetector(onTap: RouteManager().pop, child: AppIcon(assetPath: AssetPaths().arrowLeft)),
        ),
        title: Text(wallet.name),
      ),
      body: CustomScrollView(
        slivers: [
          Column(
            children: [
              _buildListTile(title: AppStrings.publicAddress, subtitle: wallet.address),
              Divider(indent: 16, endIndent: 16, height: 1),
              _buildListTile(title: AppStrings.mnemonicPhrase, subtitle: wallet.encryptedMnemonic),
            ],
          ).toSliver,
          AppSizedBox.height(48).toSliver,
          AppButton.filled(
            AppStrings.exportWallet,
            onTap: () {
              RouteManager().navigateTo(AppPageRoutes.enterPinCode);
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
