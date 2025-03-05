import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

typedef BarWidgetConfigCallback = void Function(BarWidgetConfig);

class BarsConfigTab extends StatelessWidget {
  const BarsConfigTab({
    required this.callback,
    required this.sourceBarWidgetConfig,
    super.key,
    this.bottomNavigationBarTheme,
    this.appBarTheme,
  });

  final BarWidgetConfig sourceBarWidgetConfig;
  final BottomNavigationBarThemeData? bottomNavigationBarTheme;
  final AppBarTheme? appBarTheme;
  final BarWidgetConfigCallback callback;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).light();
    final bottomBarTheme = bottomNavigationBarTheme ?? theme.bottomNavigationBarTheme;
    final appBarConfigTheme = appBarTheme ?? theme.appBarTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomNavigationBarConfig(
            sourceBarWidgetConfig: sourceBarWidgetConfig,
            theme: bottomBarTheme,
            callback: callback,
          ),
          const SizedBox(height: 16),
          AppBarConfig(
            sourceBarWidgetConfig: sourceBarWidgetConfig,
            theme: appBarConfigTheme,
            callback: callback,
            tabBarTheme: theme.tabBarTheme,
          ),
        ],
      ),
    );
  }
}

class BottomNavigationBarConfig extends StatelessWidget {
  const BottomNavigationBarConfig({
    required this.sourceBarWidgetConfig,
    required this.theme,
    required this.callback,
    super.key,
  });

  final BarWidgetConfig sourceBarWidgetConfig;
  final BottomNavigationBarThemeData? theme;
  final BarWidgetConfigCallback callback;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: 'Bottom navigation bar',
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          ColorField(
            title: 'Background color',
            constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
            color: theme?.backgroundColor,
            onTap: (color) => context.selectColor(
              initialColor: theme?.backgroundColor,
              onColorSelected: (color) => callback(
                sourceBarWidgetConfig.copyWith(
                  bottomNavigationBar:
                      sourceBarWidgetConfig.bottomNavigationBar.copyWith(backgroundColor: color.toHex()),
                ),
              ),
            ),
          ),
          ColorField(
            title: 'Selected color',
            constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
            color: theme?.selectedItemColor,
            onTap: (color) => context.selectColor(
              initialColor: theme?.selectedItemColor,
              onColorSelected: (color) => callback(
                sourceBarWidgetConfig.copyWith(
                  bottomNavigationBar:
                      sourceBarWidgetConfig.bottomNavigationBar.copyWith(selectedItemColor: color.toHex()),
                ),
              ),
            ),
          ),
          ColorField(
            title: 'Unselected color',
            constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
            color: theme?.unselectedItemColor,
            onTap: (color) => context.selectColor(
              initialColor: theme?.unselectedItemColor,
              onColorSelected: (color) => callback(
                sourceBarWidgetConfig.copyWith(
                  bottomNavigationBar:
                      sourceBarWidgetConfig.bottomNavigationBar.copyWith(unSelectedItemColor: color.toHex()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarConfig extends StatelessWidget {
  const AppBarConfig({
    required this.sourceBarWidgetConfig,
    required this.theme,
    required this.callback,
    this.tabBarTheme,
    super.key,

  });

  final BarWidgetConfig sourceBarWidgetConfig;
  final AppBarTheme? theme;
  final TabBarThemeData? tabBarTheme;
  final BarWidgetConfigCallback callback;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: 'Tab bar',
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 8,
        runSpacing: 8,
        children: [
          ColorField(
            title: 'Background color',
            constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
            color: theme?.backgroundColor,
            onTap: (color) => context.selectColor(
              initialColor: theme?.backgroundColor,
              onColorSelected: (color) => callback(
                sourceBarWidgetConfig.copyWith(
                  extTabBar: sourceBarWidgetConfig.extTabBar.copyWith(backgroundColor: color.toHex()),
                ),
              ),
            ),
          ),
          ColorField(
            title: 'Foreground color',
            constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
            color: theme?.foregroundColor,
            onTap: (color) => context.selectColor(
              initialColor: theme?.foregroundColor,
              onColorSelected: (color) => callback(
                sourceBarWidgetConfig.copyWith(
                  extTabBar: sourceBarWidgetConfig.extTabBar.copyWith(foregroundColor: color.toHex()),
                ),
              ),
            ),
          ),
          ColorField(
            title: 'Selected item color',
            constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
            color: theme?.surfaceTintColor,
            onTap: (color) => context.selectColor(
              initialColor: theme?.surfaceTintColor,
              onColorSelected: (color) => callback(
                sourceBarWidgetConfig.copyWith(
                  extTabBar: sourceBarWidgetConfig.extTabBar.copyWith(selectedItemColor: color.toHex()),
                ),
              ),
            ),
          ),
          ColorField(
            title: 'Un selected item color',
            constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
            color: tabBarTheme?.unselectedLabelColor,
            onTap: (color) => context.selectColor(
              initialColor: theme?.surfaceTintColor,
              onColorSelected: (color) => callback(
                sourceBarWidgetConfig.copyWith(
                  extTabBar: sourceBarWidgetConfig.extTabBar.copyWith(unSelectedItemColor: color.toHex()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
