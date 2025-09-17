import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import '../../../../../bloc/update_theme_cubit.dart';
import '../widgets/bottom_nav_bar_editor_minimal.dart';
import '../widgets/ext_tab_bar_editor_minimal.dart';

class BarsConfigTab extends StatelessWidget {
  const BarsConfigTab({
    required this.sourceBarWidgetConfig,
    super.key,
  });

  final BarWidgetConfig sourceBarWidgetConfig;

  @override
  Widget build(BuildContext context) {
    final cfg = sourceBarWidgetConfig;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Bottom navigation bar',
            descriptionWidget: DescriptionRow.info(
              'Configure background and item colors for the bottom navigation bar.',
            ),
            padding: const EdgeInsets.all(16),
            child: BottomNavBarEditorMinimal(
              value: cfg.bottomNavigationBar,
              onChanged: (v) {
                // dispatch granular events so state stays consistent
                final c = context.read<UpdateThemCubit>();
                if (v.backgroundColor != cfg.bottomNavigationBar.backgroundColor) {
                  c.add(ThemeWidgetEvent.setBottomNavBarBackground(v.backgroundColor));
                }
                if (v.selectedItemColor != cfg.bottomNavigationBar.selectedItemColor) {
                  c.add(ThemeWidgetEvent.setBottomNavBarSelected(v.selectedItemColor));
                }
                if (v.unSelectedItemColor != cfg.bottomNavigationBar.unSelectedItemColor) {
                  c.add(ThemeWidgetEvent.setBottomNavBarUnselected(v.unSelectedItemColor));
                }
              },
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Tab bar',
            descriptionWidget: DescriptionRow.info(
              'Configure foreground/background and selected/unselected colors for the tab bar.',
            ),
            padding: const EdgeInsets.all(16),
            child: ExtTabBarEditorMinimal(
              value: cfg.extTabBar,
              onChanged: (v) {
                final c = context.read<UpdateThemCubit>();
                if (v.backgroundColor != cfg.extTabBar.backgroundColor) {
                  c.add(ThemeWidgetEvent.setExtTabBarBackground(v.backgroundColor));
                }
                if (v.foregroundColor != cfg.extTabBar.foregroundColor) {
                  c.add(ThemeWidgetEvent.setExtTabBarForeground(v.foregroundColor));
                }
                if (v.selectedItemColor != cfg.extTabBar.selectedItemColor) {
                  c.add(ThemeWidgetEvent.setExtTabBarSelected(v.selectedItemColor));
                }
                if (v.unSelectedItemColor != cfg.extTabBar.unSelectedItemColor) {
                  c.add(ThemeWidgetEvent.setExtTabBarUnselected(v.unSelectedItemColor));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
