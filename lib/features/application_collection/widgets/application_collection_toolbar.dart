import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

class ApplicationCollectionToolbar extends StatelessWidget {
  const ApplicationCollectionToolbar({
    super.key,
    required this.onLogout,
  });

  static const _menuKeyRight = '_menuKeyRight';
  final Function() onLogout;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: const [],
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
              Wrap(
                alignment: WrapAlignment.end,
                children: _buildRightMenu(context),
              ),
              SwitcherLanguage(
                margin: const EdgeInsets.only(right: 16),
                onSwitchedLanguage: onLogout,
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
        onSelected: (value) => onLogout.call(),
        items: [
          ToolbarMenuItem(
            value: _menuKeyRight,
            text: 'My profile',
          ),
          ToolbarMenuItem(
            value: _menuKeyRight,
            text: 'Setting',
          ),
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
