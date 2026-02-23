import 'package:flutter/material.dart';

import 'package:webtrit_configurator/localization/localization.dart';

class ResetToolbar extends StatelessWidget {
  const ResetToolbar({required this.onLanguageChanged, super.key});

  final Function onLanguageChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8, right: 8),
            child: const Row(),
          ),
        ),
        Expanded(
          child: Align(
            child: Text(
              context.l10n.feature_auth_reset_toolbar_title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ),
        const Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.end)),
      ],
    );
  }
}
