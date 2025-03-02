import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/core/constant/app_input_formatters.dart';
import 'package:paribu_mobile/core/constant/app_strings.dart';
import 'package:paribu_mobile/core/constant/asset_path.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';
import 'package:paribu_mobile/core/constant/theme/app_text_styles.dart';
import 'package:paribu_mobile/core/extension/num_extension.dart';
import 'package:paribu_mobile/core/helper/edge_insets_functions.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/shared/app_button.dart';
import 'package:paribu_mobile/core/shared/app_icon.dart';
import 'package:paribu_mobile/core/shared/app_scaffold.dart';
import 'package:paribu_mobile/core/shared/app_sized_box.dart';
import 'package:paribu_mobile/core/shared/app_text_field.dart';
import 'package:paribu_mobile/core/utils/route_manager.dart';
import 'package:paribu_mobile/feature/wallet/bloc/cubit/wallet_cubit.dart';
import 'package:paribu_mobile/feature/wallet/bloc/state/wallet_state.dart';

class CreateWalletPage extends StatelessWidget {
  const CreateWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<WalletCubit>();
    return BlocBuilder<WalletCubit, WalletState>(
      bloc: cubit,
      builder:
          (context, state) => ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: AppScaffold(
              isLoading: state.isLoading,
              appBar: AppBar(
                title: Text(AppStrings.createWallet),
                actions: [
                  Padding(
                    padding: REdgeInsets.only(right: 16.0),
                    child: GestureDetector(onTap: RouteManager().pop, child: AppIcon(assetPath: AssetPaths().close)),
                  ),
                ],
                automaticallyImplyLeading: false,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: AppTextField.none(
                        controller: cubit.controller,
                        hintText: AppStrings.walletName,
                        inputFormatters: AppInputFormatters().walletName,
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      spacing: 12.h,
                      children: [
                        Text(AppStrings.max60Characters, style: AppTextStyles.px12w400.copyWith(color: AppColors.foregroundSecondary)),
                        AppButton.filled(onTap: cubit.createWallet, AppStrings.createWallet),
                      ],
                    ),
                  ),
                  AppSizedBox.bottomPadding(),
                ],
              ),
            ),
          ),
    );
  }
}
