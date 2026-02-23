import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class TextFieldConfigEditorMinimal extends StatelessWidget {
  const TextFieldConfigEditorMinimal({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final TextFieldConfig value;
  final ValueChanged<TextFieldConfig> onChanged;

  InputDecorationConfig _ensureDecoration(InputDecorationConfig? d) =>
      d ?? const InputDecorationConfig();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleConfigEditor(
          label: 'Typography',
          value: value.style ?? const TextStyleConfig(),
          onChanged: (newStyle) => onChanged(value.copyWith(style: newStyle)),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 4),
          child: Text('General Properties', style: theme.textTheme.titleSmall),
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: value.textAlign,
                        decoration: const InputDecoration(
                          labelText: 'Alignment',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                        items: const ['left', 'center', 'right']
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (v) =>
                            onChanged(value.copyWith(textAlign: v ?? 'center')),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: value.keyboardType,
                        decoration: const InputDecoration(
                          labelText: 'Keyboard',
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                        ),
                        items:
                            const [
                                  'none',
                                  'number',
                                  'phone',
                                  'text',
                                  'email',
                                  'multiline',
                                ]
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                        onChanged: (v) => onChanged(
                          value.copyWith(keyboardType: v ?? 'none'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SwitchListTile(
                  contentPadding: EdgeInsets.zero,
                  title: const Text('Show Cursor'),
                  value: value.showCursor,
                  onChanged: (v) => onChanged(value.copyWith(showCursor: v)),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 4),
          child: Text('Decoration', style: theme.textTheme.titleSmall),
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: value.decoration?.hintText,
                    decoration: const InputDecoration(
                      labelText: 'Hint Text',
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                    ),
                    onChanged: _updateHintText,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ColorInput(
                    label: 'Fill Color',
                    color: value.decoration?.fillColor?.toColor(),
                    onTap: () => _pickFillColor(context),
                    onClear: _clearFillColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Updates the hint text in the configuration.
  void _updateHintText(String v) {
    onChanged(
      value.copyWith(
        decoration: _ensureDecoration(
          value.decoration,
        ).copyWith(hintText: v.isEmpty ? null : v),
      ),
    );
  }

  /// Handles opening the color picker and updating the fill color.
  Future<void> _pickFillColor(BuildContext context) async {
    final picked = await context.showColorPicker(
      currentColor: value.decoration?.fillColor?.toColor(),
    );
    if (context.mounted && picked != null) {
      onChanged(
        value.copyWith(
          decoration: _ensureDecoration(
            value.decoration,
          ).copyWith(fillColor: picked.toHex()),
        ),
      );
    }
  }

  /// Clears the fill color.
  void _clearFillColor() {
    onChanged(
      value.copyWith(
        decoration: _ensureDecoration(
          value.decoration,
        ).copyWith(fillColor: null),
      ),
    );
  }
}
