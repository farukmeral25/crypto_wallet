import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/app_constant.dart';

class ParibuApp extends StatelessWidget {
  const ParibuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: AppConstant.appName);
  }
}
