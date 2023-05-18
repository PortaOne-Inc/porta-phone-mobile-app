import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';

class ApplicationsToolbar extends StatelessWidget {
  const ApplicationsToolbar({
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
            children: const [],
          ),
        ),
      ],
    );
  }
}
