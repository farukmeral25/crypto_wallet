import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/app_strings.dart';
import 'package:paribu_mobile/core/constant/asset_path.dart';
import 'package:paribu_mobile/core/constant/theme/app_text_styles.dart';
import 'package:paribu_mobile/core/extension/num_extension.dart';
import 'package:paribu_mobile/core/helper/edge_insets_functions.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/shared/app_icon.dart';
import 'package:paribu_mobile/core/shared/app_scaffold.dart';
import 'package:paribu_mobile/feature/wallet/bloc/cubit/wallet_cubit.dart';
import 'package:paribu_mobile/feature/wallet/data/dto/wallet_dto.dart';
import 'package:paribu_mobile/feature/wallet/view/widget/otp_field.dart';

class EnterPinCodePage extends StatelessWidget {
  const EnterPinCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final wallet = ModalRoute.of(context)?.settings.arguments as WalletDto;
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      child: AppScaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [Padding(padding: REdgeInsets.only(right: 16.0), child: GestureDetector(child: AppIcon(assetPath: AssetPaths().close)))],
        ),
        body: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16.0) + REdgeInsets.only(top: 12),
          child: Column(
            spacing: 32.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(AppStrings.pinCode, style: AppTextStyles.px32w500), OtpField(onSubmit: () => sl<WalletCubit>().exportWallet(wallet))],
          ),
        ),
      ),
    );
  }
}
