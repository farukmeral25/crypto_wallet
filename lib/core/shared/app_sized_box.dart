import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/extension/num_extension.dart';
import 'package:paribu_mobile/core/utils/screen_size.dart';

class AppSizedBox extends StatelessWidget {
  AppSizedBox._(this.size, {this.child, required AppSizedBoxType appSizedBoxType}) {
    _appSizedBoxType = appSizedBoxType;
  }

  final double size;
  final Widget? child;
  late final AppSizedBoxType _appSizedBoxType;

  factory AppSizedBox.width(double size, {Widget? child}) {
    return AppSizedBox._(size, appSizedBoxType: AppSizedBoxType.width, child: child);
  }

  factory AppSizedBox.height(double size, {Widget? child}) {
    return AppSizedBox._(size, appSizedBoxType: AppSizedBoxType.height, child: child);
  }

  factory AppSizedBox.topPadding() {
    return AppSizedBox._(ScreenSize().topPadding, appSizedBoxType: AppSizedBoxType.height);
  }

  factory AppSizedBox.bottomPadding() {
    return AppSizedBox._(ScreenSize().bottomPadding, appSizedBoxType: AppSizedBoxType.height);
  }

  factory AppSizedBox.shrink() {
    return AppSizedBox._(0, appSizedBoxType: AppSizedBoxType.shrink);
  }

  @override
  Widget build(BuildContext context) {
    switch (_appSizedBoxType) {
      case AppSizedBoxType.width:
        return SizedBox(width: size.w, child: child);
      case AppSizedBoxType.height:
        return SizedBox(height: size.h, child: child);
      case AppSizedBoxType.shrink:
        return const SizedBox.shrink();
    }
  }
}

enum AppSizedBoxType { width, height, shrink }
