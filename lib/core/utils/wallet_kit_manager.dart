import 'package:paribu_mobile/core/constant/app_environment.dart';
import 'package:reown_walletkit/reown_walletkit.dart';

class WalletKitManager {
  late ReownWalletKit walletKit;

  void createWalletKit() {
    walletKit = ReownWalletKit(
      core: ReownCore(projectId: AppEnvironment().walletKit),
      metadata: PairingMetadata(name: "paribu_mobile", description: "description", url: "https://example.com/"),
    );
  }

  Future<void> pair(String scannedUriString) async {
    Uri uri = Uri.parse(scannedUriString);
    await walletKit.pair(uri: uri);
  }
}
