import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

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
    final disabledColor =
        inputDecorationTheme.disabledBorder?.borderSide.color ?? Colors.grey;
    final focusedColor =
        inputDecorationTheme.focusedBorder?.borderSide.color ?? Colors.blue;
    final errorColor = inputDecorationTheme.errorStyle?.color ?? Colors.red;
    final fillColor = inputDecorationTheme.filled
        ? (inputDecorationTheme.fillColor ?? Colors.transparent)
        : Colors.transparent;

    final cubit = context.read<UpdateThemCubit>();

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
                  constraints: const BoxConstraints(
                    minWidth: 140,
                    minHeight: 60,
                  ),
                  color: labelColor,
                  onTap: (_) => _pickColor(
                    context,
                    labelColor,
                    (hex) =>
                        cubit.add(ThemeWidgetEvent.setInputLabelColor(hex)),
                  ),
                ),
                ColorField(
                  title: 'Disabled border color',
                  constraints: const BoxConstraints(
                    minWidth: 140,
                    minHeight: 60,
                  ),
                  color: disabledColor,
                  onTap: (_) => _pickColor(
                    context,
                    disabledColor,
                    (hex) => cubit.add(
                      ThemeWidgetEvent.setInputBorderDisabled(
                        sourceInputWidgetConfig.primary.border.disabled
                            .copyWith(typicalColor: hex),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  title: 'Focused border color',
                  constraints: const BoxConstraints(
                    minWidth: 140,
                    minHeight: 60,
                  ),
                  color: focusedColor,
                  onTap: (_) => _pickColor(
                    context,
                    focusedColor,
                    (hex) => cubit.add(
                      ThemeWidgetEvent.setInputBorderFocused(
                        sourceInputWidgetConfig.primary.border.focused.copyWith(
                          typicalColor: hex,
                        ),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  title: 'Error border color',
                  constraints: const BoxConstraints(
                    minWidth: 140,
                    minHeight: 60,
                  ),
                  color: errorColor,
                  onTap: (_) => _pickColor(
                    context,
                    errorColor,
                    (hex) => cubit.add(
                      ThemeWidgetEvent.setInputBorderFocused(
                        sourceInputWidgetConfig.primary.border.focused.copyWith(
                          errorColor: hex,
                        ),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  title: 'Fill color',
                  constraints: const BoxConstraints(
                    minWidth: 140,
                    minHeight: 60,
                  ),
                  color: fillColor,
                  onTap: (_) => _pickColor(
                    context,
                    fillColor,
                    (hex) => cubit.add(
                      ThemeWidgetEvent.setInputBorderAny(
                        sourceInputWidgetConfig.primary.border.any.copyWith(
                          typicalColor: hex,
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

  Future<void> _pickColor(
    BuildContext context,
    Color currentColor,
    void Function(String hex) onColorSelected,
  ) async {
    final pickedColor = await context.showColorPicker(
      currentColor: currentColor,
    );
    if (pickedColor != null && context.mounted) {
      onColorSelected(pickedColor.toHex());
    }
  }
}
