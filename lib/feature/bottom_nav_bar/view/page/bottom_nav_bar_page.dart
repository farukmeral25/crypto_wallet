import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paribu_mobile/core/constant/theme/app_colors.dart';
import 'package:paribu_mobile/core/extension/generic_extension.dart';
import 'package:paribu_mobile/core/init/injection_container.dart';
import 'package:paribu_mobile/core/shared/app_icon.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/bloc/cubit/bottom_nav_bar_cubit.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/bloc/state/bottom_nav_bar_state.dart';
import 'package:paribu_mobile/feature/bottom_nav_bar/data/enum/bottom_nav_bar_type.dart';

class BottomNavBarPage extends StatelessWidget {
  const BottomNavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = sl<BottomNavBarCubit>();
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      bloc: cubit,
      builder:
          (context, state) => Scaffold(
            appBar: AppBar(title: Text(state.type.label)),
            body: state.type.body,
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: BottomNavBarType.values.indexOf(state.type),
              onTap: cubit.onTapItem,
              items:
                  BottomNavBarType.values
                      .map(
                        (item) => BottomNavigationBarItem(
                          icon: AppIcon(assetPath: item.icon, color: state.type.isEquals(item) ? AppColors.green : null),
                          label: item.label,
                        ),
                      )
                      .toList(),
            ),
          ),
    );
  }
}
