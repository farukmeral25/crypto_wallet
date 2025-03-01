import 'package:flutter/material.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';

class AppScaffold extends StatelessWidget {
  final Key? scaffoldKey;
  final PreferredSizeWidget? appBar;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final Color? backgroundColor;
  final Drawer? drawer;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool isLoading;
  final bool? resizeToAvoidBottomInset;

  const AppScaffold({
    super.key,
    this.scaffoldKey,
    this.appBar,
    this.backgroundColor,
    this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomSheet,
    this.drawer,
    this.isLoading = false,
    this.resizeToAvoidBottomInset,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          key: scaffoldKey,
          backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          appBar: appBar,
          body: body,
          drawer: drawer,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation ?? FloatingActionButtonLocation.miniCenterFloat,
          bottomSheet: bottomSheet,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        ),
        Visibility(
          visible: isLoading,
          child: Stack(
            children: [
              ModalBarrier(dismissible: false, color: AppColors.foregroundPrimary.withValues(alpha: .2)),
              const Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ],
    );
  }
}
