//vs_currency=usd&days=10&interval=daily

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_param.g.dart';

@JsonSerializable()
class ChartParam {
  @JsonKey(name: "vs_currency", defaultValue: "usd")
  final String currency;
  final int from;
  final int to;

  ChartParam({this.currency = "usd", required this.from, required this.to});

  factory ChartParam.fromJson(Map<String, dynamic> json) => _$ChartParamFromJson(json);

  Map<String, dynamic> toJson() => _$ChartParamToJson(this);
}
