import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';

import '../color_field.dart';
import 'text_style_config_editor.dart';

class GroupTitleListTileEditorMinimal extends StatelessWidget {
  const GroupTitleListTileEditorMinimal({
    required this.value,
    required this.onChanged,
    this.boxConstraints = const BoxConstraints(minWidth: 140, minHeight: 60),
    this.description,
    super.key,
  });

  final GroupTitleListTileWidgetConfig value;
  final ValueChanged<GroupTitleListTileWidgetConfig> onChanged;
  final BoxConstraints boxConstraints;
  final Widget? description;

  Future<void> _pickBackgroundColor(BuildContext context) async {
    final newColor = await context.showColorPicker(
      currentColor: value.backgroundColor?.toColor(),
    );
    if (newColor != null) {
      onChanged(value.copyWith(backgroundColor: newColor.toHex()));
    }
  }

  void _onTextStyleChanged(TextStyleConfig newStyle) {
    onChanged(value.copyWith(textStyle: newStyle));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DefaultTextStyle(
              style: theme.textTheme.bodySmall ?? const TextStyle(),
              child: description!,
            ),
          ),
        ColorField(
          title: 'Background color',
          constraints: boxConstraints,
          color: value.backgroundColor?.toColor(),
          onTap: (_) => _pickBackgroundColor(context),
        ),
        const SizedBox(height: 24),
        TextStyleConfigEditor(
          label: 'Title Typography',
          value: value.textStyle ?? const TextStyleConfig(),
          onChanged: _onTextStyleChanged,
        ),
      ],
    );
  }
}
