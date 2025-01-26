// input_config_tab.dart

import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

// TODO(Serdun): add correct handling as dot it in ButtonConfigTab
class InputConfigTab extends StatelessWidget {
  const InputConfigTab({
    required this.sourceInputWidgetConfig,
    required this.inputDecorationTheme,
    required this.callback,
    super.key,
  });

  final InputWidgetConfig sourceInputWidgetConfig;
  final InputDecorationTheme inputDecorationTheme;
  final ObjectCallback<InputWidgetConfig> callback;

  @override
  Widget build(BuildContext context) {
    // Extract colors from inputDecorationTheme
    final labelColor = inputDecorationTheme.labelStyle?.color ?? Colors.black;
    final disabledColor = inputDecorationTheme.disabledBorder?.borderSide.color ?? Colors.grey;
    final focusedColor = inputDecorationTheme.focusedBorder?.borderSide.color ?? Colors.blue;
    final errorColor = inputDecorationTheme.errorStyle?.color ?? Colors.red;
    final fillColor = inputDecorationTheme.filled
        ? (inputDecorationTheme.fillColor ?? Colors.transparent)
        : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'InputDecorationTheme Configuration',
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                // Label Color Configuration
                ColorField(
                  title: 'Label Color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: labelColor,
                  onTap: (color) => context.selectColor(
                    initialColor: labelColor,
                    onColorSelected: (color) => callback(
                      sourceInputWidgetConfig.copyWith(
                        primary: sourceInputWidgetConfig.primary.copyWith(labelColor: color.toHex()),
                      ),
                    ),
                  ),
                ),
                // Disabled Border Color Configuration
                ColorField(
                  title: 'Disabled Border Color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: disabledColor,
                  onTap: (color) => context.selectColor(
                    initialColor: disabledColor,
                    onColorSelected: (color) => callback(
                      sourceInputWidgetConfig.copyWith(
                        primary: sourceInputWidgetConfig.primary.copyWith(
                            border: sourceInputWidgetConfig.primary.border.copyWith(
                                disabled: sourceInputWidgetConfig.primary.border.disabled
                                    .copyWith(typicalColor: disabledColor.toHex()))),
                      ),
                    ),
                  ),
                ),
                // Focused Border Color Configuration
                ColorField(
                  title: 'Focused Border Color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: focusedColor,
                  onTap: (color) => context.selectColor(
                    initialColor: disabledColor,
                    onColorSelected: (color) => callback(
                      sourceInputWidgetConfig.copyWith(
                        primary: sourceInputWidgetConfig.primary.copyWith(
                            border: sourceInputWidgetConfig.primary.border.copyWith(
                                focused: sourceInputWidgetConfig.primary.border.focused
                                    .copyWith(typicalColor: disabledColor.toHex()))),
                      ),
                    ),
                  ),
                ),
                // Error Style Color Configuration
                ColorField(
                  title: 'Error Text Color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: errorColor,
                  onTap: (color) => context.selectColor(
                    initialColor: disabledColor,
                    onColorSelected: (color) => callback(
                      sourceInputWidgetConfig.copyWith(
                        primary: sourceInputWidgetConfig.primary.copyWith(
                            border: sourceInputWidgetConfig.primary.border.copyWith(
                                focused: sourceInputWidgetConfig.primary.border.focused
                                    .copyWith(errorColor: errorColor.toHex()))),
                      ),
                    ),
                  ),
                ),
                // Fill Color Configuration
                ColorField(
                  title: 'Fill Color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: fillColor,
                  onTap: (color) => context.selectColor(
                    initialColor: disabledColor,
                    onColorSelected: (color) => callback(
                      sourceInputWidgetConfig.copyWith(
                        primary: sourceInputWidgetConfig.primary.copyWith(
                            border: sourceInputWidgetConfig.primary.border.copyWith(
                                any: sourceInputWidgetConfig.primary.border.any
                                    .copyWith(typicalColor: disabledColor.toHex()))),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
