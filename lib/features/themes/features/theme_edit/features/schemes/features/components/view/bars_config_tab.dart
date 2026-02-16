import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import '../../../../../bloc/update_theme_cubit.dart';

class BarsConfigTab extends StatelessWidget {
  const BarsConfigTab({
    required this.config,
    super.key,
  });

  final BarWidgetConfig config;

  void _onBottomNavChanged(BuildContext context, BottomNavigationBarWidgetConfig newValue) {
    final cubit = context.read<UpdateThemCubit>();

    // FIX: Беремо актуальний конфіг зі стейта для порівняння,
    // бо this.config може бути застарілим після зміни теми.
    final currentBarConfig = cubit.state.themeWidgetConfig.bar;
    final current = currentBarConfig.bottomNavigationBar;

    if (newValue.backgroundColor != current.backgroundColor) {
      cubit.add(ThemeWidgetEvent.setBottomNavBarBackground(newValue.backgroundColor));
    }
    if (newValue.selectedItemColor != current.selectedItemColor) {
      cubit.add(ThemeWidgetEvent.setBottomNavBarSelected(newValue.selectedItemColor));
    }
    if (newValue.unSelectedItemColor != current.unSelectedItemColor) {
      cubit.add(ThemeWidgetEvent.setBottomNavBarUnselected(newValue.unSelectedItemColor));
    }
  }

  void _onAppBarChanged(BuildContext context, AppBarConfig newValue) {
    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setExtTabBar(newValue));
  }

  void _onTabBarChanged(BuildContext context, TabBarConfig newValue) {
    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setTabBarConfig(newValue));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final currentConfig = context.select(
      (UpdateThemCubit cubit) => cubit.state.themeWidgetConfig.bar,
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('App Bar Configuration', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: AppBarConfigEditor(
                value: currentConfig.appBarConfig,
                onChanged: (v) => _onAppBarChanged(context, v),
                description: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Configure colors, geometry, typography and icons for the top bar.'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Bottom Navigation Bar', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: BottomNavBarEditorMinimal(
                value: currentConfig.bottomNavigationBar,
                onChanged: (v) => _onBottomNavChanged(context, v),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text('Tab Bar', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Card(
            margin: EdgeInsets.zero,
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TabBarConfigEditor(
                value: currentConfig.tabBarConfig,
                onChanged: (v) => _onTabBarChanged(context, v),
                description: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Configure indicators, dividers, and label styles for tabbed views.'),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
