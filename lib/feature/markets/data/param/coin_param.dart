import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_param.g.dart';

@JsonSerializable()
class CoinParam {
  @JsonKey(name: "vs_currency", defaultValue: "usd")
  final String currency;
  @JsonKey(name: "per_page", defaultValue: 10)
  final int perPage;
  @JsonKey(name: "page", defaultValue: 1)
  final int page;

  CoinParam({this.currency = "usd", this.perPage = 10, this.page = 1});

  factory CoinParam.fromJson(Map<String, dynamic> json) => _$CoinParamFromJson(json);

  Map<String, dynamic> toJson() => _$CoinParamToJson(this);
}
