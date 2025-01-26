// text_config_tab.dart

import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_phone/widgets/widgets.dart';

class TextConfigTab extends StatelessWidget {
  const TextConfigTab({
    required this.sourceTextWidgetConfig,
    required this.callback,
    super.key,
    this.textSelectionThemeData,
    this.linkifyStyles,
  });

  final TextWidgetConfig sourceTextWidgetConfig;
  final TextSelectionThemeData? textSelectionThemeData;
  final LinkifyStyles? linkifyStyles;
  final ObjectCallback<TextWidgetConfig> callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BorderContainer(
          title: 'TextSelectionWidgetConfig',
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ColorField(
                title: 'Cursor Color',
                constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                color: textSelectionThemeData?.cursorColor,
                onTap: (color) => context.selectColor(
                  initialColor: textSelectionThemeData?.cursorColor,
                  onColorSelected: (color) => callback(
                    sourceTextWidgetConfig.copyWith(
                      selection: sourceTextWidgetConfig.selection.copyWith(cursorColor: color.toHex()),
                    ),
                  ),
                ),
              ),
              ColorField(
                title: 'Selection Color',
                constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                color: textSelectionThemeData?.selectionColor,
                onTap: (color) => context.selectColor(
                  initialColor: textSelectionThemeData?.selectionColor,
                  onColorSelected: (color) => callback(
                    sourceTextWidgetConfig.copyWith(
                      selection: sourceTextWidgetConfig.selection.copyWith(selectionColor: color.toHex()),
                    ),
                  ),
                ),
              ),
              ColorField(
                title: 'Selection Handle Color',
                constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                color: textSelectionThemeData?.selectionHandleColor,
                onTap: (color) => context.selectColor(
                  initialColor: textSelectionThemeData?.selectionHandleColor,
                  onColorSelected: (color) => callback(
                    sourceTextWidgetConfig.copyWith(
                      selection: sourceTextWidgetConfig.selection.copyWith(selectionHandleColor: color.toHex()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        BorderContainer(
          title: 'LinkifyWidgetConfig',
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              ColorField(
                title: 'Style Color',
                constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                color: linkifyStyles?.primary?.style?.color,
                onTap: (color) => context.selectColor(
                  initialColor: linkifyStyles?.primary?.style?.color,
                  onColorSelected: (color) => callback(
                    sourceTextWidgetConfig.copyWith(
                      linkify: sourceTextWidgetConfig.linkify.copyWith(styleColor: color.toHex()),
                    ),
                  ),
                ),
              ),
              ColorField(
                title: 'Linkify Style Color',
                constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                color: linkifyStyles?.primary?.linkStyle?.color,
                onTap: (color) => context.selectColor(
                  initialColor: linkifyStyles?.primary?.linkStyle?.color,
                  onColorSelected: (color) => callback(
                    sourceTextWidgetConfig.copyWith(
                      linkify: sourceTextWidgetConfig.linkify.copyWith(linkifyStyleColor: color.toHex()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
