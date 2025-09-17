import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

class ElevatedButtonConfigEditorMinimal extends StatelessWidget {
  const ElevatedButtonConfigEditorMinimal({
    required this.value,
    required this.onChanged,
    this.boxConstraints = const BoxConstraints(minWidth: 160, minHeight: 80),
    super.key,
  });

  final ElevatedButtonWidgetConfig value;
  final ValueChanged<ElevatedButtonWidgetConfig> onChanged;
  final BoxConstraints boxConstraints;

  void _set({
    String? background,
    String? foreground,
    String? text,
    String? icon,
    String? disabledIcon,
  }) {
    onChanged(
      value.copyWith(
        backgroundColor: background ?? value.backgroundColor,
        foregroundColor: foreground ?? value.foregroundColor,
        textColor: text ?? value.textColor,
        iconColor: icon ?? value.iconColor,
        disabledIconColor: disabledIcon ?? value.disabledIconColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ColorField(
          title: 'Background',
          constraints: boxConstraints,
          color: value.backgroundColor?.toColor(),
          onTap: (_) => context.selectColor(
            initialColor: value.backgroundColor?.toColor(),
            onColorSelected: (c) => _set(background: c.toHex()),
          ),
        ),
        ColorField(
          title: 'Foreground',
          constraints: boxConstraints,
          color: value.foregroundColor?.toColor(),
          onTap: (_) => context.selectColor(
            initialColor: value.foregroundColor?.toColor(),
            onColorSelected: (c) => _set(foreground: c.toHex()),
          ),
        ),
        ColorField(
          title: 'Text',
          constraints: boxConstraints,
          color: value.textColor?.toColor(),
          onTap: (_) => context.selectColor(
            initialColor: value.textColor?.toColor(),
            onColorSelected: (c) => _set(text: c.toHex()),
          ),
        ),
        ColorField(
          title: 'Icon',
          constraints: boxConstraints,
          color: value.iconColor?.toColor(),
          onTap: (_) => context.selectColor(
            initialColor: value.iconColor?.toColor(),
            onColorSelected: (c) => _set(icon: c.toHex()),
          ),
        ),
        ColorField(
          title: 'Disabled Icon',
          constraints: boxConstraints,
          color: value.disabledIconColor?.toColor(),
          onTap: (_) => context.selectColor(
            initialColor: value.disabledIconColor?.toColor(),
            onColorSelected: (c) => _set(disabledIcon: c.toHex()),
          ),
        ),
      ],
    );
  }
}
