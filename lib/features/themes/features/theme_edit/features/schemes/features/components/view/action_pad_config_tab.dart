import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';

import '../models/models.dart';

typedef ActionPadWidgetConfigCallback = void Function(ActionPadWidgetConfig);

class ActionPadConfig extends StatelessWidget {
  const ActionPadConfig({
    required this.source,
    required this.callback,
    this.actionpadStyles,
    super.key,
  });

  final ActionPadWidgetConfig source;
  final ActionpadStyles? actionpadStyles;
  final ActionPadWidgetConfigCallback callback;

  @override
  Widget build(BuildContext context) {
    final themeLight = ThemeProvider.of(context).light();
    final actionPadStyles = themeLight.extension<ActionpadStyles>()?.primary;

    final actionPadList = <ObjectDescriptor<ButtonStyle, ElevatedButtonWidgetConfig?>>[
      ObjectDescriptor(
        style: actionPadStyles?.callStart,
        data: source.callStart,
        callback: (data) => callback(source.copyWith(callStart: data!)),
        title: 'Call Start',
      ),
      ObjectDescriptor(
        style: actionPadStyles?.backspacePressed,
        data: source.backspacePressed,
        callback: (data) => callback(source.copyWith(backspacePressed: data!)),
        title: 'Backspace Pressed',
      ),
      ObjectDescriptor(
        style: actionPadStyles?.callTransfer,
        data: source.callTransfer,
        callback: (data) => callback(source.copyWith(callTransfer: data!)),
        title: 'Call Transfer',
      ),
    ].nonNulls;

    const boxConstraints = BoxConstraints(minWidth: 160, minHeight: 80);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: BorderContainer(
        title: 'Action Pad Buttons',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: actionPadList.map((descriptor) {
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
                    onTap: (color) => context.selectColor(
                      initialColor: descriptor.style?.backgroundColor?.resolve({}),
                      onColorSelected: (color) => descriptor.callback!(
                        descriptor.data?.copyWith(backgroundColor: color.toHex()),
                      ),
                    ),
                  ),
                  ColorField(
                    title: 'Foreground Color',
                    constraints: boxConstraints,
                    color: descriptor.style?.foregroundColor?.resolve({}),
                    onTap: (color) => context.selectColor(
                      initialColor: descriptor.style?.foregroundColor?.resolve({}),
                      onColorSelected: (color) => descriptor.callback!(
                        descriptor.data?.copyWith(foregroundColor: color.toHex()),
                      ),
                    ),
                  ),
                  ColorField(
                    title: 'Disabled Color',
                    constraints: boxConstraints,
                    color: descriptor.style?.backgroundColor?.resolve({WidgetState.disabled}),
                    onTap: (color) => context.selectColor(
                      initialColor: descriptor.style?.backgroundColor?.resolve({WidgetState.disabled}),
                      onColorSelected: (color) => descriptor.callback!(
                        descriptor.data?.copyWith(disabledIconColor: color.toHex()),
                      ),
                    ),
                  ),
                  ColorField(
                    title: 'Text Color',
                    constraints: boxConstraints,
                    color: descriptor.style?.textStyle?.resolve({})?.color,
                    onTap: (color) => context.selectColor(
                      initialColor: descriptor.style?.textStyle?.resolve({})?.color,
                      onColorSelected: (color) => descriptor.callback!(
                        descriptor.data?.copyWith(textColor: color.toHex()),
                      ),
                    ),
                  ),
                  ColorField(
                    title: 'Icon Color',
                    constraints: boxConstraints,
                    color: descriptor.style?.iconColor?.resolve({}),
                    onTap: (color) => context.selectColor(
                      initialColor: descriptor.style?.iconColor?.resolve({}),
                      onColorSelected: (color) => descriptor.callback!(
                        descriptor.data?.copyWith(iconColor: color.toHex()),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
