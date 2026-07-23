import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';

class AlignmentControl extends StatelessWidget {
  const AlignmentControl({
    required this.alignment,
    required this.onChanged,
    super.key,
  });

  final AlignmentConfig alignment;
  final ValueChanged<AlignmentConfig> onChanged;

  static const _alignments = <List<AlignmentConfig>>[
    [
      AlignmentConfig.topLeft,
      AlignmentConfig.topCenter,
      AlignmentConfig.topRight,
    ],
    [
      AlignmentConfig.centerLeft,
      AlignmentConfig.center,
      AlignmentConfig.centerRight,
    ],
    [
      AlignmentConfig.bottomLeft,
      AlignmentConfig.bottomCenter,
      AlignmentConfig.bottomRight,
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final dividerColor = theme.dividerColor;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(2),
      child: Column(
        children: _alignments.map((row) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: row.map((align) {
              final isSelected = alignment == align;

              return InkWell(
                onTap: () => onChanged(align),
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  width: 30,
                  height: 30,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.primary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.circle,
                    size: 6,
                    color: isSelected
                        ? colorScheme.onPrimary
                        : theme.disabledColor,
                  ),
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
