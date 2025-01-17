import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../models/models.dart';

typedef ButtonWidgetConfigCallback = void Function(ButtonWidgetConfig);

/// Creates a button descriptor for the given [ButtonStyle] and [title].
ObjectDescriptor<ButtonStyle, void>? _createButtonDescriptor(ButtonStyle? style, String title) {
  return style != null ? ObjectDescriptor<ButtonStyle, void>(style: style, title: title) : null;
}

class ButtonConfigTab extends StatelessWidget {
  const ButtonConfigTab({
    required this.sourceButtonWidgetConfig,
    required this.elevatedButtonStyles,
    required this.callback,
    super.key,
  });

  final ButtonWidgetConfig sourceButtonWidgetConfig;
  final ElevatedButtonStyles? elevatedButtonStyles;
  final ButtonWidgetConfigCallback callback;

  @override
  Widget build(BuildContext context) {
    const boxConstraints = BoxConstraints(minWidth: 160, minHeight: 140);

    final buttonDescriptors = [
      _createButtonDescriptor(elevatedButtonStyles?.primary, 'Primary'),
      _createButtonDescriptor(elevatedButtonStyles?.primaryOnDark, 'Primary on Dark'),
      _createButtonDescriptor(elevatedButtonStyles?.neutral, 'Neutral'),
      _createButtonDescriptor(elevatedButtonStyles?.neutralOnDark, 'Neutral on Dark'),
    ].whereType<ObjectDescriptor<ButtonStyle, void>>().toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buttonDescriptors.map((descriptor) {
          return ButtonStyleSection(
            descriptor: descriptor,
            boxConstraints: boxConstraints,
            sourceButtonWidgetConfig: sourceButtonWidgetConfig,
            callback: callback,
          );
        }).toList(),
      ),
    );
  }
}

class ButtonStyleSection extends StatelessWidget {
  const ButtonStyleSection({
    required this.descriptor,
    required this.boxConstraints,
    required this.sourceButtonWidgetConfig,
    required this.callback,
    super.key,
  });

  final ObjectDescriptor<ButtonStyle, void> descriptor;
  final BoxConstraints boxConstraints;
  final ButtonWidgetConfig sourceButtonWidgetConfig;
  final ButtonWidgetConfigCallback callback;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: descriptor.title,
      padding: const EdgeInsets.all(16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ColorField(
            title: 'Background Color',
            constraints: boxConstraints,
            color: descriptor.style?.backgroundColor?.resolve({}),
            onTap: (selectedColor) => context.selectColor(
              initialColor: descriptor.style?.backgroundColor?.resolve({}),
              onColorSelected: (color) => _updateButtonConfig(backgroundColor: color.toHex()),
            ),
          ),
          ColorField(
            title: 'Foreground Color',
            constraints: boxConstraints,
            color: descriptor.style?.foregroundColor?.resolve({}),
            onTap: (selectedColor) => context.selectColor(
              initialColor: descriptor.style?.foregroundColor?.resolve({}),
              onColorSelected: (color) => _updateButtonConfig(foregroundColor: color.toHex()),
            ),
          ),
          ColorField(
            title: 'Disabled Color',
            constraints: boxConstraints,
            color: descriptor.style?.backgroundColor?.resolve({WidgetState.disabled}),
            onTap: (selectedColor) => context.selectColor(
              initialColor: descriptor.style?.backgroundColor?.resolve({WidgetState.disabled}),
              onColorSelected: (color) => _updateButtonConfig(disabledIconColor: color.toHex()),
            ),
          ),
          ColorField(
            title: 'Text Color',
            constraints: boxConstraints,
            color: descriptor.style?.textStyle?.resolve({})?.color,
            onTap: (selectedColor) => context.selectColor(
              initialColor: descriptor.style?.textStyle?.resolve({})?.color,
              onColorSelected: (color) => _updateButtonConfig(textColor: color.toHex()),
            ),
          ),
          ColorField(
            title: 'Icon Color',
            constraints: boxConstraints,
            color: descriptor.style?.iconColor?.resolve({}),
            onTap: (selectedColor) => context.selectColor(
              initialColor: descriptor.style?.iconColor?.resolve({}),
              onColorSelected: (color) => _updateButtonConfig(iconColor: color.toHex()),
            ),
          ),
        ],
      ),
    );
  }

  void _updateButtonConfig({
    String? backgroundColor,
    String? foregroundColor,
    String? disabledIconColor,
    String? textColor,
    String? iconColor,
  }) {
    final updatedConfig = sourceButtonWidgetConfig.primaryElevatedButton.copyWith(
      backgroundColor: backgroundColor ?? sourceButtonWidgetConfig.primaryElevatedButton.backgroundColor,
      foregroundColor: foregroundColor ?? sourceButtonWidgetConfig.primaryElevatedButton.foregroundColor,
      disabledIconColor: disabledIconColor ?? sourceButtonWidgetConfig.primaryElevatedButton.disabledIconColor,
      textColor: textColor ?? sourceButtonWidgetConfig.primaryElevatedButton.textColor,
      iconColor: iconColor ?? sourceButtonWidgetConfig.primaryElevatedButton.iconColor,
    );

    callback.call(sourceButtonWidgetConfig.copyWith(primaryElevatedButton: updatedConfig));
  }
}
