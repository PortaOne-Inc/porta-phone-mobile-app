import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import '../../../../../bloc/update_theme_cubit.dart';

class InputConfigTab extends StatelessWidget {
  const InputConfigTab({required this.sourceInputWidgetConfig, required this.inputDecorationTheme, super.key});

  final InputWidgetConfig sourceInputWidgetConfig;
  final InputDecorationThemeData inputDecorationTheme;

  @override
  Widget build(BuildContext context) {
    // Read colors from the source config, not the built theme: the phone's
    // InputDecorationTheme factory packs every state into a single resolver assigned
    // to `border`, leaving `disabledBorder`/`focusedBorder` null, and label/error
    // styles are likewise derived. Reading them back would fall through to the
    // defaults and misreport the configured color. Keep these nullable so an unset
    // color renders as "Not defined." in ColorField instead of a fake default that
    // pretends a value was configured.
    final labelColor = sourceInputWidgetConfig.primary.labelColor?.toColor();
    final disabledColor = sourceInputWidgetConfig.primary.border.disabled.typicalColor?.toColor();
    final focusedColor = sourceInputWidgetConfig.primary.border.focused.typicalColor?.toColor();
    final errorColor = sourceInputWidgetConfig.primary.border.focused.errorColor?.toColor();
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
            descriptionWidget: DescriptionRow.info('Configure label and border colors used by text inputs.'),
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ColorField(
                  title: 'Label color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: labelColor,
                  onTap: (color) =>
                      _pickColor(context, color, (hex) => cubit.add(ThemeWidgetEvent.setInputLabelColor(hex))),
                ),
                ColorField(
                  title: 'Disabled border color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: disabledColor,
                  onTap: (color) => _pickColor(
                    context,
                    color,
                    (hex) => cubit.add(
                      ThemeWidgetEvent.setInputBorderDisabled(
                        sourceInputWidgetConfig.primary.border.disabled.copyWith(typicalColor: hex),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  title: 'Focused border color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: focusedColor,
                  onTap: (color) => _pickColor(
                    context,
                    color,
                    (hex) => cubit.add(
                      ThemeWidgetEvent.setInputBorderFocused(
                        sourceInputWidgetConfig.primary.border.focused.copyWith(typicalColor: hex),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  title: 'Error border color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: errorColor,
                  onTap: (color) => _pickColor(
                    context,
                    color,
                    (hex) => cubit.add(
                      ThemeWidgetEvent.setInputBorderFocused(
                        sourceInputWidgetConfig.primary.border.focused.copyWith(errorColor: hex),
                      ),
                    ),
                  ),
                ),
                ColorField(
                  title: 'Fill color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: fillColor,
                  onTap: (_) => _pickColor(
                    context,
                    fillColor,
                    (hex) => cubit.add(
                      ThemeWidgetEvent.setInputBorderAny(
                        sourceInputWidgetConfig.primary.border.any.copyWith(typicalColor: hex),
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

  Future<void> _pickColor(BuildContext context, Color currentColor, void Function(String hex) onColorSelected) async {
    final pickedColor = await context.showColorPicker(currentColor: currentColor);
    if (pickedColor != null && context.mounted) {
      onColorSelected(pickedColor.toHex());
    }
  }
}
