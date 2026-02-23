import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_phone/widgets/widgets.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class TextConfigTab extends StatelessWidget {
  const TextConfigTab({
    required this.sourceTextWidgetConfig,
    super.key,
    this.textSelectionThemeData,
    this.linkifyStyles,
  });

  final TextWidgetConfig sourceTextWidgetConfig;
  final TextSelectionThemeData? textSelectionThemeData;
  final LinkifyStyles? linkifyStyles;

  Future<void> _pickColor(
    BuildContext context,
    Color? current,
    ValueChanged<String> onApply,
  ) async {
    final newColor = await context.showColorPicker(currentColor: current);
    if (newColor != null) {
      onApply(newColor.toHex());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context).light();
    final sel = textSelectionThemeData ?? theme.textSelectionTheme;
    final link = (linkifyStyles ?? theme.extension<LinkifyStyles>())?.primary;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Text selection',
            descriptionWidget: DescriptionRow.info(
              'Cursor and selection colors for editable text.',
            ),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Cursor color',
                    color: sel.cursorColor,
                    onTap: () => _pickColor(
                      context,
                      sel.cursorColor,
                      (hex) => context.read<UpdateThemCubit>().add(
                        ThemeWidgetEvent.setTextCursorColor(hex),
                      ),
                    ),
                    onClear: () {},
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Selection color',
                    color: sel.selectionColor,
                    onTap: () => _pickColor(
                      context,
                      sel.selectionColor,
                      (hex) => context.read<UpdateThemCubit>().add(
                        ThemeWidgetEvent.setTextSelectionColor(hex),
                      ),
                    ),
                    onClear: () {},
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Handle color',
                    color: sel.selectionHandleColor,
                    onTap: () => _pickColor(
                      context,
                      sel.selectionHandleColor,
                      (hex) => context.read<UpdateThemCubit>().add(
                        ThemeWidgetEvent.setTextSelectionHandleColor(hex),
                      ),
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
            descriptionWidget: DescriptionRow.info(
              'Colors for inline links and their base text style.',
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Style color',
                    color: link?.style?.color,
                    onTap: () => _pickColor(
                      context,
                      link?.style?.color,
                      (hex) => context.read<UpdateThemCubit>().add(
                        ThemeWidgetEvent.setLinkifyStyleColor(hex),
                      ),
                    ),
                    onClear: () {},
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ColorInput(
                    label: 'Link color',
                    color: link?.linkStyle?.color,
                    onTap: () => _pickColor(
                      context,
                      link?.linkStyle?.color,
                      (hex) => context.read<UpdateThemCubit>().add(
                        ThemeWidgetEvent.setLinkifyLinkColor(hex),
                      ),
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
