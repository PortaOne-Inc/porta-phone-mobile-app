import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

class CredentialsDialog extends StatelessWidget {
  const CredentialsDialog({
    required this.themeId,
    required this.applicationId,
    super.key,
  });

  final String themeId;
  final String applicationId;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: const Text('Credentials'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(child: Text(context.l10n.feature_application_id)),
              Flexible(
                child: GestureDetector(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: applicationId,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const WidgetSpan(child: SizedBox(width: 8)),
                        WidgetSpan(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Icon(
                              Icons.copy,
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () =>
                      Clipboard.setData(ClipboardData(text: applicationId)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Flexible(child: Text('Theme id:')),
              Flexible(
                child: GestureDetector(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: themeId,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        const WidgetSpan(child: SizedBox(width: 8)),
                        WidgetSpan(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Icon(
                              Icons.copy,
                              size: 16,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () => Clipboard.setData(ClipboardData(text: themeId)),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        Button(
          onPressed: () {
            Navigator.of(context).pop();
          },
          title: 'OK',
        ),
      ],
    );
  }
}
