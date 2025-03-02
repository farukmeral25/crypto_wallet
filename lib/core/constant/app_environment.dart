import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironment {
  AppEnvironment._();
  factory AppEnvironment() {
    return _instance;
  }

  static final AppEnvironment _instance = AppEnvironment._();

  String get fileName => kDebugMode ? ".env.dev" : ".env.prod";
  String get domain => dotenv.get('COIN_GEKKO_DOMAIN', fallback: 'BASE_URL not found');
  String get apiKey => dotenv.get('X_CG_DEMO_API_KEY', fallback: 'X_CG_DEMO_API_KEY not found');
  String get walletKit => dotenv.get('WALLET_KIT', fallback: 'WALLET_KIT not found');
}
