import 'package:flutter/material.dart';

class MarketBody extends StatelessWidget {
  const MarketBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => Text("Chart: $index"), itemCount: 10);
  }
}
