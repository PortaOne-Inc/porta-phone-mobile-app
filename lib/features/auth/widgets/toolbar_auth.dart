import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/config/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/widgets.dart';

class VendorsToolbar extends StatelessWidget {
  const VendorsToolbar({
    super.key,
    required this.onLanguageChanged,
  });

  final Function onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: const [],
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
              SwitcherLanguage(
                margin: const EdgeInsets.only(right: 16),
                onSwitchedLanguage: onLanguageChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
