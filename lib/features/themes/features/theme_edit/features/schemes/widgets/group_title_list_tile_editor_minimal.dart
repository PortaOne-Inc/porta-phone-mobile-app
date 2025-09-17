import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

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

  void _patch({String? bg, String? text}) {
    onChanged(
      value.copyWith(
        backgroundColor: bg ?? value.backgroundColor,
        textColor: text ?? value.textColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: description,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ColorField(
              title: 'Background color',
              constraints: boxConstraints,
              color: value.backgroundColor?.toColor(),
              onTap: (_) => context.selectColor(
                initialColor: value.backgroundColor?.toColor(),
                onColorSelected: (c) => _patch(bg: c.toHex()),
              ),
            ),
            ColorField(
              title: 'Text color',
              constraints: boxConstraints,
              color: value.textColor?.toColor(),
              onTap: (_) => context.selectColor(
                initialColor: value.textColor?.toColor(),
                onColorSelected: (c) => _patch(text: c.toHex()),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
