import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

/// Editor for [AppConfigLocalization.enabledLanguages] - the allowlist of
/// languages the app exposes. Selecting none means "no restriction" (all
/// bundled languages are available), matching the phone's default behavior.
class LocalizationConfigWidget extends StatelessWidget {
  const LocalizationConfigWidget({required this.localization, required this.onChanged, super.key});

  final AppConfigLocalization localization;
  final ValueChanged<AppConfigLocalization> onChanged;

  // Mirrors the languages bundled in the phone app (lib/l10n/arb/app_*.arb).
  // Keep in sync when the app gains or drops a translation.
  static const _availableLanguages = <String, String>{
    'en': 'English',
    'it': 'Italian',
    'th': 'Thai',
    'uk': 'Ukrainian',
  };

  @override
  Widget build(BuildContext context) {
    final enabled = localization.enabledLanguages.map((code) => code.trim().toLowerCase()).toSet();

    void toggle(String code, bool selected) {
      final next = {...enabled};
      if (selected) {
        next.add(code);
      } else {
        next.remove(code);
      }
      // Preserve the order of the known list for stable JSON output.
      final ordered = _availableLanguages.keys.where(next.contains).toList();
      onChanged(localization.copyWith(enabledLanguages: ordered));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'Languages',
          descriptionWidget: DescriptionRow.info(
            'Choose which languages the app exposes. When none are selected there is '
            'no restriction and all bundled languages are available. Select one (e.g. '
            'English only) to hide the rest from the language picker and auto-resolution.',
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final entry in _availableLanguages.entries)
                CheckboxListTile.adaptive(
                  contentPadding: EdgeInsets.zero,
                  title: Text('${entry.value} (${entry.key})'),
                  value: enabled.contains(entry.key),
                  onChanged: (v) => toggle(entry.key, v ?? false),
                ),
              if (enabled.isNotEmpty) ...[
                const Divider(),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    icon: const Icon(Icons.clear, size: 18),
                    label: const Text('Clear (all languages)'),
                    onPressed: () => onChanged(localization.copyWith(enabledLanguages: const [])),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
