import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:crypto_wallet_mobile/app.dart';
import 'package:crypto_wallet_mobile/core/constant/app_environment.dart';
import 'package:crypto_wallet_mobile/core/init/injection_container.dart' as locator;
import 'package:crypto_wallet_mobile/core/init/injection_container.dart';
import 'package:crypto_wallet_mobile/core/utils/aes_helper.dart';
import 'package:crypto_wallet_mobile/core/utils/app_permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppPermissionHandler.requestStoragePermission();

  await Future.wait([dotenv.load(fileName: AppEnvironment().fileName), locator.init()]);
  sl<AESHelper>().initialize();

  runApp(const CryptoWalletApp());
}
