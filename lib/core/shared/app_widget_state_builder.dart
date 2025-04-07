import 'package:flutter/material.dart';
import 'package:crypto_wallet_mobile/core/error/failure.dart';
import 'package:crypto_wallet_mobile/core/extension/string_extension.dart';
import 'package:crypto_wallet_mobile/core/extension/widget_extension.dart';
import 'package:crypto_wallet_mobile/core/utils/ui_state.dart';

enum WidgetType { sliver, none }

class AppWidgetStateBuilder<T> extends StatelessWidget {
  AppWidgetStateBuilder._({
    super.key,
    required this.builder,
    required this.status,
    this.idleWidget,
    this.loadingWidget,
    this.errorWidget,
    this.failure,
    required WidgetType widgetType,
  }) {
    _type = widgetType;
  }

  final Widget builder;
  final UIStateStatus status;
  final Widget? idleWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Failure? failure;
  late final WidgetType _type;

  factory AppWidgetStateBuilder.none({
    required Widget builder,
    required UIStateStatus status,
    Widget? idleWidget,
    Widget? loadingWidget,
    Widget? errorWidget,
    Failure? failure,
  }) {
    return AppWidgetStateBuilder._(
      builder: builder,
      status: status,
      idleWidget: idleWidget,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      failure: failure,
      widgetType: WidgetType.none,
    );
  }

  factory AppWidgetStateBuilder.sliver({
    required Widget builder,
    required UIStateStatus status,
    Failure? failure,
    Widget? idleWidget,
    Widget? loadingWidget,
    Widget? errorWidget,
  }) {
    return AppWidgetStateBuilder._(
      builder: builder,
      status: status,
      idleWidget: idleWidget,
      loadingWidget: loadingWidget,
      errorWidget: errorWidget,
      failure: failure,
      widgetType: WidgetType.sliver,
    );
  }
  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case WidgetType.none:
        switch (status) {
          case UIStateStatus.idle:
            return idleWidget ?? const SizedBox.shrink();
          case UIStateStatus.loading:
            return Center(child: loadingWidget ?? const CircularProgressIndicator.adaptive());
          case UIStateStatus.success:
            return builder;
          case UIStateStatus.error:
            return Center(
              child: errorWidget ??
                  Text((failure?.message).getValueOrDefault, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            );
        }

      case WidgetType.sliver:
        switch (status) {
          case UIStateStatus.idle:
            return (idleWidget ?? const SizedBox.shrink()).toSliver;
          case UIStateStatus.loading:
            return Center(child: (loadingWidget ?? const CircularProgressIndicator.adaptive())).toSliver;
          case UIStateStatus.success:
            return builder;
          case UIStateStatus.error:
            return Center(
              child: errorWidget ??
                  Text((failure?.message).getValueOrDefault, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
            ).toSliver;
        }
    }
  }
}
