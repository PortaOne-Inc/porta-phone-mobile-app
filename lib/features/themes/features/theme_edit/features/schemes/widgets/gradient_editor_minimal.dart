import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import '../features/components/widgets/gradient_field.dart';

typedef HexListChanged = void Function(List<String> hexColors);

class GradientEditorMinimal extends StatelessWidget {
  const GradientEditorMinimal({
    required this.colors,
    required this.onChanged,
    this.description,
    super.key,
  });

  /// Current gradient colors as HEX strings
  final List<String> colors;
  final HexListChanged onChanged;
  final Widget? description;

  List<Color> get _materialColors => colors.map((e) => e.toColor()).toList();

  void _emit(BuildContext context, List<Color> list) {
    onChanged(list.map((c) => c.toHex()).toList());
  }

  @override
  Widget build(BuildContext context) {
    final materialColors = _materialColors;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: description,
          ),
        GradientField(
          colors: materialColors,
          onAddColor: (List<Color?> current) {
            context.selectColor(
              initialColor: Colors.white,
              onColorSelected: (c) {
                final merged = [...current, c].nonNulls.toList();
                _emit(context, merged);
              },
            );
          },
          onRemoveColor: (color) {
            final next = List<Color>.from(materialColors);
            final idx = next.indexWhere((c) => c == color);
            if (idx != -1) next.removeAt(idx);
            _emit(context, next);
          },
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: materialColors.map((c) {
            return ColorField(
              title: 'color',
              constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
              color: c,
              onTap: (_) => context.selectColor(
                initialColor: c,
                onColorSelected: (picked) {
                  final next = List<Color>.from(materialColors);
                  final idx = next.indexWhere((x) => x == c);
                  if (idx != -1) next[idx] = picked;
                  _emit(context, next);
                },
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
