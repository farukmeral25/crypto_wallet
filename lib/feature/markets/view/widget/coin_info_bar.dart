import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_text_styles.dart';
import 'package:crypto_wallet_mobile/core/extension/double_extension.dart';
import 'package:crypto_wallet_mobile/core/extension/num_extension.dart';
import 'package:crypto_wallet_mobile/core/shared/app_icon.dart';
import 'package:crypto_wallet_mobile/feature/markets/data/dto/coin_dto.dart';

class CoinInfoBar extends StatelessWidget {
  const CoinInfoBar({super.key, required this.coin});
  final CoinDto coin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(spacing: 12.w, children: [AppIcon(assetPath: coin.image, height: 24.h), Text(coin.name, style: AppTextStyles.px14w500)]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("${coin.currentPrice.toCurrency} USD"),
              Text("${coin.percentage}${coin.value.toStringAsFixed(2)}", style: AppTextStyles.px12w400.copyWith(color: coin.textColor)),
            ],
          ),
        ],
      ),
    );
  }
}
