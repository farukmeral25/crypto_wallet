import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/core/constant/app_page_routes.dart';
import 'package:paribu_mobile/core/constant/app_strings.dart';
import 'package:paribu_mobile/core/constant/asset_path.dart';
import 'package:paribu_mobile/core/extension/list_extension.dart';
import 'package:paribu_mobile/core/extension/widget_extension.dart';
import 'package:paribu_mobile/core/helper/edge_insets_functions.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/shared/app_button.dart';
import 'package:paribu_mobile/core/shared/app_icon.dart';
import 'package:paribu_mobile/core/shared/app_sized_box.dart';
import 'package:paribu_mobile/core/shared/app_widget_state_builder.dart';
import 'package:paribu_mobile/core/utils/route_manager.dart';
import 'package:paribu_mobile/feature/wallet/bloc/cubit/wallet_cubit.dart';
import 'package:paribu_mobile/feature/wallet/bloc/state/wallet_state.dart';

class WalletBody extends StatefulWidget {
  const WalletBody({super.key});

  @override
  State<WalletBody> createState() => _WalletBodyState();
}

class _WalletBodyState extends State<WalletBody> {
  final cubit = sl<WalletCubit>();
  @override
  void initState() {
    super.initState();
    cubit.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletCubit, WalletState>(
      bloc: cubit,
      builder:
          (context, state) => CustomScrollView(
            slivers: [
              AppWidgetStateBuilder.sliver(
                builder: SliverList.separated(
                  itemBuilder: (context, index) {
                    final wallet = state.wallets[index];
                    return Dismissible(
                      key: Key(wallet.address),
                      onDismissed: (_) => cubit.deleteWallet(wallet),
                      child: ListTile(
                        onTap: () => RouteManager().navigateTo(AppPageRoutes.walletManage, arguments: wallet),
                        title: Text(wallet.name, overflow: TextOverflow.ellipsis),
                        subtitle: Text(wallet.address, overflow: TextOverflow.ellipsis),
                        trailing: AppIcon(assetPath: AssetPaths().arrowRightiOS, height: 32),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(indent: 16, endIndent: 16);
                  },
                  itemCount: state.wallets.itemCount,
                ),
                failure: state.failure,
                status: state.walletsStatus,
              ),
              AppSizedBox.height(48).toSliver,
              AppButton.filled(
                AppStrings.createWallet,
                onTap: () {
                  RouteManager().navigateTo(AppPageRoutes.createWallet);
                },
              ).toSliverPadding(padding: REdgeInsets.symmetric(horizontal: 16)),
              AppButton.text(
                AppStrings.importWallet,
                onTap: () {
                  RouteManager().navigateTo(AppPageRoutes.enterPinCode);
                },
              ).toSliverPadding(padding: REdgeInsets.symmetric(horizontal: 16)),
            ],
          ),
    );
  }
}
