import 'package:flutter/material.dart';

class ChartsBody extends StatelessWidget {
  const ChartsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => Text("Chart: $index"), itemCount: 10);
  }
}
