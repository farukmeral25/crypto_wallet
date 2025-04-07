import 'package:crypto_wallet_mobile/core/extension/list_extension.dart';

extension DoubleExtension on double? {
  String get toCurrency {
    final parts = this?.toStringAsFixed(2).split('.');
    final integerPart = parts.getValueOrDefault[0];
    final decimalPart = parts.getValueOrDefault[1];

    // Binlik ayırıcı ekleyelim
    final buffer = StringBuffer();
    for (int i = 0; i < integerPart.length; i++) {
      final index = integerPart.length - i;
      buffer.write(integerPart[i]);
      if (index > 1 && index % 3 == 1) {
        buffer.write(',');
      }
    }

    return '${buffer.toString()}.$decimalPart';
  }
}
