import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/share/widgets/widgets.dart';

class ThemesToolbar extends StatelessWidget {
  const ThemesToolbar({
    super.key,
    required this.themeMode,
    required this.onSwitchedLanguage,
    required this.onNewTheme,
    required this.onLogout,
    required this.onInfo,
    required this.onThemeChange,
  });

  final ThemeMode themeMode;

  static const _menuKeyRight = '_menuKeyRight';
  static const _menuKeyLogOut = '_menuKeyOnLogout';
  static const _menuKeyInfo = '_menuKeyOnInfo';

  final Function() onSwitchedLanguage;
  final Function() onNewTheme;
  final Function() onLogout;
  final Function() onInfo;

  final Function(ThemeMode) onThemeChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Wrap(
                alignment: WrapAlignment.end,
                children: _buildLeftMenu(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              context.l10n.feature_theme_collection_Toolbar_title,
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
        )
      ],
    );
  }

  List<Widget> _buildLeftMenu(BuildContext context) {
    return [
      ToolbarPopupMenu(
        onSelected: (value) => onNewTheme.call(),
        items: [
          ToolbarMenuItem(
            value: _menuKeyRight,
            text: 'New',
          ),
        ],
        child: ToolbarLabelItem(
          text: context.l10n.common_file,
        ),
      )
    ];
  }

  List<Widget> _buildRightMenu(BuildContext context) {
    return [
      ToolbarPopupMenu(
        onSelected: (value) {
          if (value == _menuKeyLogOut) {
            onLogout.call();
          }
          if (value == _menuKeyInfo) {
            onInfo.call();
          }
        },
        items: [
          ToolbarMenuItem(
            value: _menuKeyInfo,
            text: 'Info',
          ),
          ToolbarMenuItem(
            value: _menuKeyLogOut,
            text: 'Log out',
          )
        ],
        child: const ToolbarLabelWidgetItem(
          icon: Icons.account_circle,
          margin: EdgeInsets.symmetric(horizontal: 8),
        ),
      )
    ];
  }
}
