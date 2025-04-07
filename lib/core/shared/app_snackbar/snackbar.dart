import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/asset_path.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_colors.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_text_styles.dart';
import 'package:crypto_wallet_mobile/core/extension/num_extension.dart';
import 'package:crypto_wallet_mobile/core/helper/edge_insets_functions.dart';
import 'package:crypto_wallet_mobile/core/keys/app_keys.dart';
import 'package:crypto_wallet_mobile/core/shared/app_icon.dart';

class AppSnackBar {
  static void show(String title, {String? description}) {
    AppKeys.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        padding: REdgeInsets.symmetric(horizontal: 16, vertical: 12),
        duration: const Duration(seconds: 2),
        content: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Text(title, style: AppTextStyles.px14w500.copyWith(color: AppColors.white))),
            Padding(
              padding: REdgeInsets.only(left: 12.0),
              child: GestureDetector(
                onTap: AppKeys.scaffoldMessengerKey.currentState?.hideCurrentSnackBar,
                child: AppIcon(assetPath: AssetPaths().close, color: AppColors.white),
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
