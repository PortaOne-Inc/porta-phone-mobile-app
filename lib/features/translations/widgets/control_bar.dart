import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/localization/localization.dart';

class ControlBar extends StatelessWidget {
  const ControlBar({
    required this.locales,
    required this.localeFilter,
    required this.onLocaleChanged,
    required this.onSearchChanged,
    super.key,
    this.enabled = true,
  });

  final Set<String> locales;
  final String localeFilter;
  final ObjectCallback<String> onLocaleChanged;
  final ObjectCallback<String> onSearchChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: DropdownButton<String>(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                borderRadius: BorderRadius.circular(8),
                isDense: true,
                value: localeFilter.isEmpty ? '' : localeFilter,
                underline: const SizedBox(),
                items:
                    locales
                        .map(
                          (locale) => DropdownMenuItem(
                            value: locale,
                            child: Text(locale),
                          ),
                        )
                        .toList()
                      ..add(
                        DropdownMenuItem(
                          value: '',
                          child: Text(
                            context.l10n.feature_translation_ControlBar_all,
                          ),
                        ),
                      ),
                onChanged: enabled ? (it) => onLocaleChanged(it!) : null,
                disabledHint: localeFilter.isEmpty
                    ? Text(context.l10n.feature_translation_ControlBar_all)
                    : Text(localeFilter),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  onChanged: enabled ? onSearchChanged : null,
                  cursorRadius: const Radius.circular(16),
                  decoration: InputDecoration.collapsed(
                    hintText:
                        context.l10n.feature_translation_ControlBar_search_hint,
                  ),
                  enabled: enabled,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
