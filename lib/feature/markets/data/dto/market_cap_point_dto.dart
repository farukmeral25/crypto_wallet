class MarketCapPoint {
  final int timestamp;
  final double marketCap;

  MarketCapPoint({required this.timestamp, required this.marketCap});

  factory MarketCapPoint.fromList(List<dynamic> list) {
    return MarketCapPoint(timestamp: list.first, marketCap: list.last);
  }
}
