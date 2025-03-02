import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';
import 'package:paribu_mobile/core/constant/theme/app_text_styles.dart';
import 'package:paribu_mobile/core/extension/generic_extension.dart';
import 'package:paribu_mobile/core/shared/app_sized_box.dart';
import 'package:paribu_mobile/feature/markets/data/dto/market_cap_price_dto.dart';

class CoinChart extends StatelessWidget {
  const CoinChart({super.key, required this.marketCapPrices, this.isUp = true});
  final List<MarketCapPrice> marketCapPrices;
  final bool isUp;

  @override
  Widget build(BuildContext context) {
    MarketCapPrice? minMarketCap;
    MarketCapPrice? maxMarketCap;
    final linearGradient = LinearGradient(
      colors: isUp ? [AppColors.green, AppColors.green.withAlpha(25)] : [AppColors.red, AppColors.red.withAlpha(25)],
    );
    if (marketCapPrices.isNotEmpty) {
      minMarketCap = marketCapPrices.reduce((a, b) => a.marketCap < b.marketCap ? a : b);
      maxMarketCap = marketCapPrices.reduce((a, b) => a.marketCap > b.marketCap ? a : b);
    }

    if (minMarketCap.isNull && maxMarketCap.isNull) {
      return AppSizedBox.shrink();
    }

    return AppSizedBox.height(
      140,
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 10,
          minY: minMarketCap?.marketCap ?? 0,
          maxY: maxMarketCap?.marketCap ?? 0,
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(show: false),
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (touchedSpot) => linearGradient.colors.last,
              getTooltipItems: (touchedSpots) {
                return [
                  LineTooltipItem(
                    "\$${touchedSpots.first.y.toStringAsFixed(2)}",
                    AppTextStyles.px12w400.copyWith(color: linearGradient.colors.first),
                  ),
                ];
              },
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots:
                  marketCapPrices.map((e) {
                    return FlSpot(marketCapPrices.indexOf(e).toDouble(), e.marketCap);
                  }).toList(),

              gradient: linearGradient,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    ColorTween(begin: linearGradient.colors.first, end: linearGradient.colors.last).lerp(0.2)!.withValues(alpha: 0.1),
                    ColorTween(begin: linearGradient.colors.first, end: linearGradient.colors.last).lerp(0.2)!.withValues(alpha: 0.1),
                  ],
                ),
              ),
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
