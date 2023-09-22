import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

import 'package:webtrit_configurator/core/core.dart';

class ThemesEditToolbar extends StatelessWidget {
  const ThemesEditToolbar({
    super.key,
    required this.title,
    required this.onSaveTheme,
    required this.onLogout,
    required this.onPreload,
    required this.onImportAssetsFromSvg,
    required this.themeMode,
    required this.onThemeChange,
  });

  static const _menuLeftSave = '_menuLeftSave';
  static const _menuLeftPreload = '_menuLeftPreload';
  static const _menuLeftImportAssetsFromSvg = '_menuLeftImportAssetsFromSvg';
  static const _menuRightLogout = '_menuRightLogout';

  final String title;

  final ThemeMode themeMode;

  final Function() onSaveTheme;
  final Function() onLogout;
  final Function() onPreload;
  final Function() onImportAssetsFromSvg;
  final Function(ThemeMode) onThemeChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: _buildLeftMenu(context),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              title,
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

  List<Widget> _buildRightMenu(BuildContext context) {
    return [
      ToolbarPopupMenu(
        onSelected: (value) => _handleAccountMenu(value),
        items: [
          ToolbarMenuItem(
            value: _menuRightLogout,
            text: 'Log out',
          )
        ],
        child: const ToolbarLabelWidgetItem(
          icon: Icons.account_circle,
          margin: EdgeInsets.symmetric(horizontal: 8),
        ),
      ),
    ];
  }

  List<Widget> _buildLeftMenu(BuildContext context) {
    return [
      ToolbarPopupMenu(
        onSelected: (value) => _handleActionsMenu(value),
        items: [
          ToolbarMenuItem(
            value: _menuLeftSave,
            text: 'Save',
          ),
        ],
        child: const ToolbarLabelItem(
          text: 'File',
        ),
      ),
      ToolbarPopupMenu(
        onSelected: (value) => _handleActionsMenu(value),
        items: [
          ToolbarMenuItem(
            value: _menuLeftPreload,
            text: context.l10n.feature_theme_edit_Template,
          ),
          ToolbarMenuItem(
            value: _menuLeftImportAssetsFromSvg,
            text: 'Import launch assets from svg',
          ),
        ],
        child: const ToolbarLabelItem(
          text: 'Theme',
        ),
      ),
    ];
  }

  void _handleActionsMenu(Object? value) {
    if (value == _menuLeftSave) {
      onSaveTheme();
    }
    if (value == _menuLeftPreload) {
      onPreload();
    }
    if (value == _menuLeftImportAssetsFromSvg) {
      onImportAssetsFromSvg();
    }
  }

  void _handleAccountMenu(Object? value) {
    if (value == _menuRightLogout) {
      onLogout();
    }
  }
}
