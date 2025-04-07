import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_colors.dart';
import 'package:crypto_wallet_mobile/core/constant/theme/app_text_styles.dart';

enum ButtonType { filled, text }

class AppButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  final ButtonType _buttonType;

  const AppButton.filled(this.text, {super.key, this.onTap}) : _buttonType = ButtonType.filled;

  const AppButton.text(this.text, {super.key, this.onTap, TextStyle? style}) : _buttonType = ButtonType.text;

  @override
  Widget build(BuildContext context) {
    switch (_buttonType) {
      case ButtonType.filled:
        return _buildStandartButton(context);
      case ButtonType.text:
        return _buildTextButton(context);
    }
  }

  Widget _buildStandartButton(BuildContext context) {
    return FilledButton(onPressed: onTap, child: Text(text, style: AppTextStyles.px14w500.copyWith(color: AppColors.white)));
  }

  Widget _buildTextButton(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(text, style: AppTextStyles.px14w500));
  }
}
