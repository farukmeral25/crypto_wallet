import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/asset_path.dart';
import 'package:crypto_wallet_mobile/core/shared/app_icon.dart';

class SamplePage extends StatelessWidget {
  const SamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ListTile(title: Text("Title"), subtitle: Text("Subtitle"), trailing: AppIcon(assetPath: AssetPaths().wallet))],
        ),
      ),
    );
  }
}
