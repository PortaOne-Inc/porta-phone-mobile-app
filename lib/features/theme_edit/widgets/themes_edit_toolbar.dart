import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';

import 'package:webtrit_configurator/share/widgets/widgets.dart';

class ThemesEditToolbar extends StatelessWidget {
  const ThemesEditToolbar({
    super.key,
    required this.title,
    required this.onSaveTheme,
    required this.onLogout,
    required this.onPreload,
  });

  final String title;

  static const _menuLeftSave = '_menuLeftSave';
  static const _menuLeftPreload = '_menuLeftPreload';
  static const _menuRightLogout = '_menuRightLogout';

  final Function() onSaveTheme;
  final Function() onLogout;
  final Function() onPreload;

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
  }

  void _handleAccountMenu(Object? value) {
    if (value == _menuRightLogout) {
      onLogout();
    }
  }
}
