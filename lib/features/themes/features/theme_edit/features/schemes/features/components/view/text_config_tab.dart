import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class TextConfigTab extends StatelessWidget {
  const TextConfigTab({required this.sourceTextWidgetConfig, super.key});

  final TextWidgetConfig sourceTextWidgetConfig;

  Future<void> _pickColor(BuildContext context, Color? current, ValueChanged<String> onApply) async {
    final newColor = await context.showColorPicker(currentColor: current);
    if (newColor != null) {
      onApply(newColor.toHex());
    }
  }

  @override
  Widget build(BuildContext context) {
    // Read colors from the source config, not the built theme: an unset value must
    // render as "not defined" rather than a derived theme color that hides the gap.
    final selection = sourceTextWidgetConfig.selection;
    final linkify = sourceTextWidgetConfig.linkify;
    final cursorColor = selection.cursorColor?.toColor();
    final selectionColor = selection.selectionColor?.toColor();
    final selectionHandleColor = selection.selectionHandleColor?.toColor();
    final linkStyleColor = linkify.styleColor?.toColor();
    final linkColor = linkify.linkifyStyleColor?.toColor();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Text selection',
            descriptionWidget: DescriptionRow.info('Cursor and selection colors for editable text.'),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Cursor color',
                    color: cursorColor,
                    onTap: () => _pickColor(
                      context,
                      cursorColor,
                      (hex) => context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setTextCursorColor(hex)),
                    ),
                    onClear: () {},
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Selection color',
                    color: selectionColor,
                    onTap: () => _pickColor(
                      context,
                      selectionColor,
                      (hex) => context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setTextSelectionColor(hex)),
                    ),
                    onClear: () {},
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Handle color',
                    color: selectionHandleColor,
                    onTap: () => _pickColor(
                      context,
                      selectionHandleColor,
                      (hex) => context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setTextSelectionHandleColor(hex)),
                    ),
                    onClear: () {},
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          BorderContainer(
            title: 'Linkify',
            descriptionWidget: DescriptionRow.info('Colors for inline links and their base text style.'),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Style color',
                    color: linkStyleColor,
                    onTap: () => _pickColor(
                      context,
                      linkStyleColor,
                      (hex) => context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setLinkifyStyleColor(hex)),
                    ),
                    onClear: () {},
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Link color',
                    color: linkColor,
                    onTap: () => _pickColor(
                      context,
                      linkColor,
                      (hex) => context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setLinkifyLinkColor(hex)),
                    ),
                    onClear: () {},
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
