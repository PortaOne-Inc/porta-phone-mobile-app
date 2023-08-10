import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

class ApplicationCollectionToolbar extends StatelessWidget {
  const ApplicationCollectionToolbar({
    super.key,
    required this.themeMode,
    required this.onLogout,
    required this.onThemeChange,
  });

  static const _menuKeyRight = '_menuKeyRight';

  final ThemeMode themeMode;

  final Function() onLogout;
  final Function(ThemeMode) onThemeChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Row(
            children: [],
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              context.l10n.feature_applications_title,
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
        onSelected: (value) => onLogout.call(),
        items: [
          ToolbarMenuItem(
            value: _menuKeyRight,
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
