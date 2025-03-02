import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';
import 'package:paribu_mobile/core/extension/num_extension.dart';
import 'package:paribu_mobile/feature/markets/data/dto/market_cap_price_dto.dart';

part 'coin_dto.g.dart';

@JsonSerializable()
class CoinDto {
  final String id;
  final String symbol;
  final String name;
  final String image;
  @JsonKey(name: "current_price")
  final double currentPrice;
  @JsonKey(name: "market_cap_change_percentage_24h")
  final double changePercentage24h;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<MarketCapPrice>? marketCapPrices;

  CoinDto({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.changePercentage24h,
    this.marketCapPrices,
  });

  factory CoinDto.fromJson(Map<String, dynamic> json) => _$CoinDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDtoToJson(this);

  Color get textColor => changePercentage24h > 0 ? AppColors.green : (changePercentage24h.isZero ? AppColors.foregroundPrimary : AppColors.red);
  double get value => changePercentage24h > 0 ? changePercentage24h : changePercentage24h.abs();
  String get percentage => changePercentage24h > 0 ? "+%" : (changePercentage24h.isZero ? "%" : "-%");
  bool get isUp => changePercentage24h > 0;

  CoinDto copyWith({
    String? id,
    String? symbol,
    String? name,
    String? image,
    double? currentPrice,
    double? changePercentage24h,
    List<MarketCapPrice>? marketCapPrices,
  }) {
    return CoinDto(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      image: image ?? this.image,
      currentPrice: currentPrice ?? this.currentPrice,
      changePercentage24h: changePercentage24h ?? this.changePercentage24h,
      marketCapPrices: marketCapPrices ?? this.marketCapPrices,
    );
  }
}
