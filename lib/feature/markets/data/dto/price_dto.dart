import 'package:paribu_mobile/feature/markets/data/dto/market_cap_point_dto.dart';

class PriceDto {
  final List<MarketCapPrice> marketCaps;

  PriceDto({required this.marketCaps});

  factory PriceDto.fromJson(Map<String, dynamic> json) {
    return PriceDto(marketCaps: (json['prices'] as List).map((item) => MarketCapPrice.fromList(item)).toList());
  }
}
