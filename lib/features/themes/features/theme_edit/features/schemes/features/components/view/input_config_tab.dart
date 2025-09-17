import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import '../../../../../bloc/update_theme_cubit.dart';

class InputConfigTab extends StatelessWidget {
  const InputConfigTab({
    required this.sourceInputWidgetConfig,
    required this.inputDecorationTheme,
    super.key,
  });

  final InputWidgetConfig sourceInputWidgetConfig;
  final InputDecorationThemeData inputDecorationTheme;

  @override
  Widget build(BuildContext context) {
    final labelColor = inputDecorationTheme.labelStyle?.color ?? Colors.black;
    final disabledColor = inputDecorationTheme.disabledBorder?.borderSide.color ?? Colors.grey;
    final focusedColor = inputDecorationTheme.focusedBorder?.borderSide.color ?? Colors.blue;
    final errorColor = inputDecorationTheme.errorStyle?.color ?? Colors.red;
    final fillColor =
        inputDecorationTheme.filled ? (inputDecorationTheme.fillColor ?? Colors.transparent) : Colors.transparent;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'InputDecorationTheme',
            descriptionWidget: DescriptionRow.info(
              'Configure label and border colors used by text inputs.',
            ),
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ColorField(
                  title: 'Label color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: labelColor,
                  onTap: (_) => context.selectColor(
                    initialColor: labelColor,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setInputLabelColor(c.toHex()),
                        ),
                  ),
                ),
                ColorField(
                  title: 'Disabled border color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: disabledColor,
                  onTap: (_) => context.selectColor(
                    initialColor: disabledColor,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setInputBorderDisabled(
                            sourceInputWidgetConfig.primary.border.disabled.copyWith(
                              typicalColor: c.toHex(),
                            ),
                          ),
                        ),
                  ),
                ),
                ColorField(
                  title: 'Focused border color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: focusedColor,
                  onTap: (_) => context.selectColor(
                    initialColor: focusedColor,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setInputBorderFocused(
                            sourceInputWidgetConfig.primary.border.focused.copyWith(
                              typicalColor: c.toHex(),
                            ),
                          ),
                        ),
                  ),
                ),
                ColorField(
                  title: 'Error border color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: errorColor,
                  onTap: (_) => context.selectColor(
                    initialColor: errorColor,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setInputBorderFocused(
                            sourceInputWidgetConfig.primary.border.focused.copyWith(
                              errorColor: c.toHex(),
                            ),
                          ),
                        ),
                  ),
                ),
                ColorField(
                  title: 'Fill color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: fillColor,
                  onTap: (_) => context.selectColor(
                    initialColor: fillColor,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setInputBorderAny(
                            sourceInputWidgetConfig.primary.border.any.copyWith(
                              typicalColor: c.toHex(),
                            ),
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
