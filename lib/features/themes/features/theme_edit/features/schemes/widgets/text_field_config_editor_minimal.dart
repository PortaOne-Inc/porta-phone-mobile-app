import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import '_common/_common.dart';

class TextFieldConfigEditorMinimal extends StatelessWidget {
  const TextFieldConfigEditorMinimal({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final TextFieldConfig value;
  final ValueChanged<TextFieldConfig> onChanged;

  TextStyleConfig _tsOrNew(TextStyleConfig? s) => s ?? const TextStyleConfig();

  InputDecorationConfig _decOrNew(InputDecorationConfig? d) => d ?? const InputDecorationConfig();

  @override
  Widget build(BuildContext context) {
    final style = value.style ?? const TextStyleConfig();

    void setStyle(TextStyleConfig s) => onChanged(value.copyWith(style: s));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextStyleEditorCompact(
          title: 'Text style',
          initialColor: style.color?.toColor(),
          onColor: (c) => setStyle(_tsOrNew(style).copyWith(color: c?.toHex())),
          familyInit: style.fontFamily ?? '',
          onFamily: (v) => setStyle(_tsOrNew(style).copyWith(fontFamily: v.isEmpty ? null : v)),
          sizeInit: (style.fontSize ?? '').toString(),
          onSize: (v) => setStyle(_tsOrNew(style).copyWith(fontSize: double.tryParse(v))),
          weightInit: (style.fontWeight?.weight ?? '').toString(),
          onWeight: (v) {
            final w = int.tryParse(v);
            setStyle(_tsOrNew(style).copyWith(fontWeight: w == null ? null : FontWeightConfig(weight: w)));
          },
        ),
        BorderContainer(
          child: Row(
            spacing: 12,
            children: [
              Expanded(
                child: DropdownLabeled<String>(
                  label: 'Text align',
                  value: value.textAlign,
                  items: const ['left', 'center', 'right'],
                  onChanged: (v) => onChanged(value.copyWith(textAlign: v ?? 'center')),
                  width: 180,
                ),
              ),
              Expanded(
                child: DropdownLabeled<String>(
                  label: 'Keyboard type',
                  value: value.keyboardType,
                  items: const ['none', 'number', 'phone', 'text', 'email', 'multiline'],
                  onChanged: (v) => onChanged(value.copyWith(keyboardType: v ?? 'none')),
                  width: 220,
                ),
              ),
            ],
          ),
        ),
        BorderContainer(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('Show cursor'),
            value: value.showCursor,
            onChanged: (v) => onChanged(value.copyWith(showCursor: v)),
          ),
        ),
        const SizedBox(height: 12),
        BorderContainer(
          title: 'Decoration',
          child: Row(
            spacing: 12,
            children: [
              Expanded(
                child: OutlineInput(
                  label: 'Hint text',
                  initial: value.decoration?.hintText ?? '',
                  onChanged: (v) => onChanged(
                    value.copyWith(
                      decoration: _decOrNew(value.decoration).copyWith(hintText: v.isEmpty ? null : v),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ColorField(
                  title: 'Fill color',
                  color: value.decoration?.fillColor?.toColor(),
                  constraints: const BoxConstraints(minWidth: 160, minHeight: 48, maxHeight: 48),
                  onTap: (_) => context.selectColor(
                    initialColor: value.decoration?.fillColor?.toColor(),
                    onColorSelected: (c) => onChanged(
                      value.copyWith(
                        decoration: _decOrNew(value.decoration).copyWith(
                          fillColor: c.toHex(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
