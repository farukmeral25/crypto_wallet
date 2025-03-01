//vs_currency=usd&days=10&interval=daily

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_param.g.dart';

@JsonSerializable()
class ChartParam {
  @JsonKey(name: "vs_currency", defaultValue: "usd")
  final String currency;
  @JsonKey(defaultValue: 10)
  final int days;
  @JsonKey(defaultValue: "daily")
  final String interval;

  ChartParam({this.currency = "usd", this.days = 10, this.interval = "daily"});

  factory ChartParam.fromJson(Map<String, dynamic> json) => _$ChartParamFromJson(json);

  Map<String, dynamic> toJson() => _$ChartParamToJson(this);
}
