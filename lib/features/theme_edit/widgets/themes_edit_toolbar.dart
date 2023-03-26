import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

class ThemesEditToolbar extends StatelessWidget {
  const ThemesEditToolbar({
    super.key,
    required this.onSaveTheme,
    required this.onSkipChanges,
    required this.onOpen,
    required this.onDownload,
    required this.onLanguageChanged,
    required this.onLogout,
    required this.onApiCredential,
    required this.onApiEndpoints,
  });

  static const _menuLeftSave = '_menuLeftSave';
  static const _menuLeftOpen = '_menuLeftOpen';
  static const _menuLeftDownload = '_menuLeftDownload';

  static const _menuRightLogout = '_menuRightLogout';

  static const _menuAPICredential = '_menuAPICredential';
  static const _menuAPIEndpoints = '_menuAPIEndpoints';

  static const _menuLeftSkipToDefault = '_menuLeftSkipToDefault';

  final Function() onSaveTheme;
  final Function() onSkipChanges;
  final Function() onOpen;

  final Function() onApiCredential;
  final Function() onApiEndpoints;

  final Function() onDownload;

  final Function() onLanguageChanged;
  final Function() onLogout;

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
              context.l10n.feature_theme_edit_Toolbar_dashboard,
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
              SwitcherLanguage(
                margin: const EdgeInsets.only(right: 16),
                onSwitchedLanguage: onLanguageChanged,
              )
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
            text: 'My profile',
          ),
          ToolbarMenuItem(
            text: 'Setting',
          ),
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
          ToolbarMenuItem(
            value: _menuLeftOpen,
            text: 'Open',
          ),
        ],
        child: const ToolbarLabelItem(
          text: 'File',
        ),
      ),
      ToolbarPopupMenu(
        onSelected: (value) => _handleAPIMenu(value),
        items: [
          ToolbarMenuItem(
            value: _menuAPICredential,
            text: 'Credentials',
          ),
          ToolbarMenuItem(
            value: _menuAPIEndpoints,
            text: 'Endpoints',
          ),
        ],
        child: const ToolbarLabelItem(
          text: 'API',
        ),
      ),
    ];
  }

  void _handleActionsMenu(Object? value) {
    if (value == _menuLeftSkipToDefault) {
      onSkipChanges();
    }
    if (value == _menuLeftSave) {
      onSaveTheme();
    }
    if (value == _menuLeftOpen) {
      onOpen();
    }
    if (value == _menuLeftDownload) {
      onDownload();
    }
  }

  void _handleAccountMenu(Object? value) {
    if (value == _menuRightLogout) {
      onLogout();
    }
  }

  void _handleAPIMenu(Object? value) {
    if (value == _menuAPIEndpoints) {
      onApiEndpoints();
    }
    if (value == _menuAPICredential) {
      onApiCredential();
    }
  }
}
