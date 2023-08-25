import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

class ThemeCreateToolbar extends StatelessWidget {
  const ThemeCreateToolbar({
    super.key,
    required this.onSwitchedLanguage,
    required this.themeMode,
    required this.onThemeChange,
  });

  final ThemeMode themeMode;

  final Function() onSwitchedLanguage;
  final Function(ThemeMode) onThemeChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: _buildLeftMenu(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                context.l10n.feature_theme_create_title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ThemeModeSwitcher(
                  themeMode: themeMode,
                  onThemeChange: onThemeChange,
                ),
                Wrap(
                  alignment: WrapAlignment.end,
                  children: _buildRightMenu(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLeftMenu() => [];

  List<Widget> _buildRightMenu(BuildContext context) {
    return [];
  }
}
