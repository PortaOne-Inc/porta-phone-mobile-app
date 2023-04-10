import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/core/widgets/slider/slider_property_control.dart';

class TextStyleItem extends StatelessWidget {
  const TextStyleItem({
    super.key,
    required this.title,
    required this.onLineHeight,
    required this.onLaterSpacing,
    required this.onWordSpacing,
    this.margin = EdgeInsets.zero,
  });

  final String title;
  final EdgeInsets margin;
  final Function(double value) onLineHeight;
  final Function(double value) onLaterSpacing;
  final Function(double value) onWordSpacing;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Colors.orange, width: 6),
              // right: BorderSide(color: Theme.of(context).colorScheme.primary, width: 5),
            ),
          ),
          child: ExpansionTile(
              trailing: const Icon(Icons.settings),
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              children: [
                SliderPropertyControl(
                    0,
                    margin: const EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 32),
                    (e) => onLineHeight.call(e),
                    maxWidth: 100,
                    label: context.l10n.configurator_text_line_height),
                SliderPropertyControl(
                    0,
                    margin: const EdgeInsets.only(left: 16, top: 4, bottom: 4, right: 32),
                    (e) => onLaterSpacing.call(e),
                    maxWidth: 100,
                    label: context.l10n.configurator_text_later_spacing),
                SliderPropertyControl(
                    0,
                    margin: const EdgeInsets.only(left: 16, top: 4, bottom: 12, right: 32),
                    (e) => onWordSpacing.call(e),
                    maxWidth: 100,
                    label: context.l10n.configurator_text_word_spacing),
              ]),
        ),
      ),
    );
  }
}
