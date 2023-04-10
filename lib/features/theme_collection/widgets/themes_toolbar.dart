import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

class ThemesToolbar extends StatelessWidget {
  const ThemesToolbar({
    super.key,
    required this.onSwitchedLanguage,
    required this.onNewTheme,
  });

  static const _menuKeyRight = '_menuKeyRight';
  final Function() onSwitchedLanguage;
  final Function() onNewTheme;

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
              SwitcherLanguage(
                margin: const EdgeInsets.only(right: 16),
                onSwitchedLanguage: onSwitchedLanguage,
              )
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
}
