import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

/// Edits a single ElevatedButtonWidgetConfig in a compact way.
/// No defaults, no hardcoded colors — only what user sets.
/// Uses ColorField + selectColor(...) helper.
class ButtonStyleEditorMinimal extends StatelessWidget {
  const ButtonStyleEditorMinimal({
    required this.value,
    required this.onChanged,
    this.titlePrefix,
    super.key,
  });

  /// Current button style config (can be empty).
  final ElevatedButtonWidgetConfig value;

  /// Called with a fully updated copy.
  final ValueChanged<ElevatedButtonWidgetConfig> onChanged;

  /// Optional label prefix, e.g. "Call Start" → "Call Start (bg)" etc.
  final String? titlePrefix;

  ElevatedButtonWidgetConfig _btnOrNew(ElevatedButtonWidgetConfig? b) => b ?? const ElevatedButtonWidgetConfig();

  void _setBackground(Color? c) => onChanged(_btnOrNew(value).copyWith(backgroundColor: c?.toHex()));

  void _setForeground(Color? c) => onChanged(_btnOrNew(value).copyWith(foregroundColor: c?.toHex()));

  void _setText(Color? c) => onChanged(_btnOrNew(value).copyWith(textColor: c?.toHex()));

  void _setIcon(Color? c) => onChanged(_btnOrNew(value).copyWith(iconColor: c?.toHex()));

  void _setDisabledBg(Color? c) => onChanged(_btnOrNew(value).copyWith(disabledBackgroundColor: c?.toHex()));

  void _setDisabledFg(Color? c) => onChanged(_btnOrNew(value).copyWith(disabledForegroundColor: c?.toHex()));

  void _setDisabledIcon(Color? c) => onChanged(_btnOrNew(value).copyWith(disabledIconColor: c?.toHex()));

  String _t(String suffix) => titlePrefix == null ? suffix : '$titlePrefix $suffix';

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        // Enabled state
        ColorField(
          title: _t('(bg)'),
          subtitle: 'Background color when button is enabled',
          color: value.backgroundColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 170, minHeight: 56),
          onTap: (_) => context.selectColor(
            initialColor: value.backgroundColor?.toColor(),
            onColorSelected: _setBackground,
          ),
        ),
        ColorField(
          title: _t('(fg)'),
          subtitle: 'Foreground color (ink ripple, overlay)',
          color: value.foregroundColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 170, minHeight: 56),
          onTap: (_) => context.selectColor(
            initialColor: value.foregroundColor?.toColor(),
            onColorSelected: _setForeground,
          ),
        ),
        ColorField(
          title: _t('(text)'),
          subtitle: 'Text label color',
          color: value.textColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 170, minHeight: 56),
          onTap: (_) => context.selectColor(
            initialColor: value.textColor?.toColor(),
            onColorSelected: _setText,
          ),
        ),
        ColorField(
          title: _t('(icon)'),
          subtitle: 'Icon color',
          color: value.iconColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 170, minHeight: 56),
          onTap: (_) => context.selectColor(
            initialColor: value.iconColor?.toColor(),
            onColorSelected: _setIcon,
          ),
        ),

        // Disabled state
        ColorField(
          title: _t('(disabled bg)'),
          subtitle: 'Background color when button is disabled',
          color: value.disabledBackgroundColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 170, minHeight: 56),
          onTap: (_) => context.selectColor(
            initialColor: value.disabledBackgroundColor?.toColor(),
            onColorSelected: _setDisabledBg,
          ),
        ),
        ColorField(
          title: _t('(disabled fg)'),
          subtitle: 'Foreground color when button is disabled',
          color: value.disabledForegroundColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 170, minHeight: 56),
          onTap: (_) => context.selectColor(
            initialColor: value.disabledForegroundColor?.toColor(),
            onColorSelected: _setDisabledFg,
          ),
        ),
        ColorField(
          title: _t('(disabled icon)'),
          subtitle: 'Icon color when button is disabled',
          color: value.disabledIconColor?.toColor(),
          constraints: const BoxConstraints(minWidth: 170, minHeight: 56),
          onTap: (_) => context.selectColor(
            initialColor: value.disabledIconColor?.toColor(),
            onColorSelected: _setDisabledIcon,
          ),
        ),
      ],
    );
  }
}
