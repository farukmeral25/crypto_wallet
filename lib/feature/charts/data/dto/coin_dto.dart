import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_dto.g.dart';

@JsonSerializable()
class CoinDto {
  final String id;
  final String symbol;
  final String name;
  final String image;
  @JsonKey(name: "current_price")
  final double currentPrice;

  CoinDto({required this.id, required this.symbol, required this.name, required this.image, required this.currentPrice});

  factory CoinDto.fromJson(Map<String, dynamic> json) => _$CoinDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDtoToJson(this);
}
