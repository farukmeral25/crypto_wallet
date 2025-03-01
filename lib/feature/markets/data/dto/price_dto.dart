import 'package:paribu_mobile/feature/markets/data/dto/market_cap_point_dto.dart';

class PriceDto {
  final List<MarketCapPoint> marketCaps;

  PriceDto({required this.marketCaps});

  factory PriceDto.fromJson(Map<String, dynamic> json) {
    return PriceDto(marketCaps: (json['market_caps'] as List).map((item) => MarketCapPoint.fromList(item)).toList());
  }
}
