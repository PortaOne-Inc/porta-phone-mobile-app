import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_phone/widgets/widgets.dart';

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
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ColorField(
                  title: 'Cursor color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: sel.cursorColor,
                  onTap: (_) => context.selectColor(
                    initialColor: sel.cursorColor,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setTextCursorColor(c.toHex()),
                        ),
                  ),
                ),
                ColorField(
                  title: 'Selection color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: sel.selectionColor,
                  onTap: (_) => context.selectColor(
                    initialColor: sel.selectionColor,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setTextSelectionColor(c.toHex()),
                        ),
                  ),
                ),
                ColorField(
                  title: 'Handle color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: sel.selectionHandleColor,
                  onTap: (_) => context.selectColor(
                    initialColor: sel.selectionHandleColor,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setTextSelectionHandleColor(c.toHex()),
                        ),
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
              spacing: 8,
              runSpacing: 8,
              children: [
                ColorField(
                  title: 'Style color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: link?.style?.color,
                  onTap: (_) => context.selectColor(
                    initialColor: link?.style?.color,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setLinkifyStyleColor(c.toHex()),
                        ),
                  ),
                ),
                ColorField(
                  title: 'Link color',
                  constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                  color: link?.linkStyle?.color,
                  onTap: (_) => context.selectColor(
                    initialColor: link?.linkStyle?.color,
                    onColorSelected: (c) => context.read<UpdateThemCubit>().add(
                          ThemeWidgetEvent.setLinkifyLinkColor(c.toHex()),
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
