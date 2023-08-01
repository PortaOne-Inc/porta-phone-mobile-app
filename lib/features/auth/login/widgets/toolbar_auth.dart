import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

class ApplicationsToolbar extends StatelessWidget {
  const ApplicationsToolbar({
    super.key,
    required this.themeMode,
    required this.onLanguageChanged,
    required this.onThemeChange,
  });

  final ThemeMode themeMode;

  final Function onLanguageChanged;
  final Function(ThemeMode) onThemeChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: const Row(
              children: [],
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(
              context.l10n.feature_auth_Toolbar_title_phone_configurator,
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
            ],
          ),
        ),
      ],
    );
  }
}
