import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:paribu_mobile/app.dart';
import 'package:paribu_mobile/core/constant/app_environment.dart';
import 'package:paribu_mobile/core/init/injection_container.dart' as locator;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([dotenv.load(fileName: AppEnvironment().fileName), locator.init()]);

  runApp(const ParibuApp());
}
