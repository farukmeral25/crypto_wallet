import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/constant/app_page_routes.dart';
import 'package:crypto_wallet_mobile/core/keys/app_keys.dart';

class RouteManager {
  static final RouteManager _instance = RouteManager._internal();

  factory RouteManager() {
    return _instance;
  }

  RouteManager._internal();

  void navigateTo(AppPageRoutes routeName, {dynamic arguments}) {
    AppKeys.navigatorKey.currentState?.pushNamed(routeName.value, arguments: arguments);
  }

  void navigateToRemoveUntil(AppPageRoutes routeName, {dynamic arguments, RoutePredicate? predicate}) {
    AppKeys.navigatorKey.currentState?.pushNamedAndRemoveUntil(routeName.value, predicate ?? (route) => false, arguments: arguments);
  }

  void navigateToReplacement(AppPageRoutes routeName, {dynamic arguments}) {
    AppKeys.navigatorKey.currentState?.pushReplacementNamed(routeName.value, arguments: arguments);
  }

  void popUntil({RoutePredicate? predicate}) {
    return AppKeys.navigatorKey.currentState?.popUntil(predicate ?? (route) => route.isFirst);
  }

  void pop<T>([T? result]) {
    AppKeys.navigatorKey.currentState?.pop(result);
  }
}
