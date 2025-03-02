class MarketCapPrice {
  final int timestamp;
  final double marketCap;

  MarketCapPrice({required this.timestamp, required this.marketCap});

  factory MarketCapPrice.fromList(List<dynamic> list) {
    return MarketCapPrice(timestamp: list.first, marketCap: list.last);
  }
}
