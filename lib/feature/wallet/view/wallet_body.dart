import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/app_strings.dart';
import 'package:paribu_mobile/core/constant/asset_path.dart';
import 'package:paribu_mobile/core/extension/widget_extension.dart';
import 'package:paribu_mobile/core/helper/edge_insets_functions.dart';
import 'package:paribu_mobile/core/shared/app_button.dart';
import 'package:paribu_mobile/core/shared/app_icon.dart';

class WalletBody extends StatelessWidget {
  const WalletBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.separated(
          itemBuilder:
              (context, index) => ListTile(
                title: Text("Wallet A", overflow: TextOverflow.ellipsis),
                subtitle: Text("0xabcd1234567bd1b76A09Cf2817F456a89C9FF1bb", overflow: TextOverflow.ellipsis),
                trailing: AppIcon(assetPath: AssetPaths().arrowRightiOS, height: 32),
              ),
          separatorBuilder: (BuildContext context, int index) {
            return Divider(indent: 16, endIndent: 16);
          },
          itemCount: 4,
        ),

        AppButton.filled(AppStrings.createWallet).toSliverPadding(padding: REdgeInsets.symmetric(horizontal: 16)),
      ],
    );
  }
}
