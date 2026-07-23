import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

class DefaultLoginOption extends StatelessWidget {
  const DefaultLoginOption({
    required this.sourceAppConfigLogin,
    required this.onWelcomeTextChanged,
    super.key,
  });

  final AppConfigLogin sourceAppConfigLogin;
  final ObjectCallback<String> onWelcomeTextChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: Text('Welcome Text:', style: textTheme.labelLarge)),
            Expanded(
              flex: 2,
              child: TextFormField(
                // initialValue: sourceAppConfigLogin.label ?? '',
                initialValue: '',
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 8,
                  ),
                  border: OutlineInputBorder(),
                ),
                onChanged: onWelcomeTextChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
