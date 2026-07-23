import 'package:flutter/material.dart';

import 'package:webtrit_configurator/extensions/extensions.dart';

class GradientField extends StatelessWidget {
  const GradientField({
    required this.colors,
    required this.onAddColor,
    required this.onRemoveColor,
    this.margin = EdgeInsets.zero,
    super.key,
  });

  final List<Color> colors;
  final EdgeInsets margin;
  final void Function(Color) onRemoveColor;
  final void Function(List<Color?> colors) onAddColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final textTheme = Theme.of(context).textTheme;
        final gradientWidth = MediaQuery.of(context).size.width / 10;
        final hasGradient = colors.length >= 2;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: margin,
              elevation: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (colors.isEmpty)
                              Text(
                                'No colors set yet',
                                style: textTheme.bodyMedium,
                              ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: constraints.maxWidth - 48,
                                minHeight: 24,
                              ),
                              child: Wrap(
                                children: colors
                                    .map(
                                      (e) => Text(
                                        '${e.toHex()} ',
                                        style: textTheme.labelSmall?.copyWith(
                                          color: e,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: gradientWidth,
                          height: 40,
                          decoration: BoxDecoration(
                            gradient: hasGradient
                                ? LinearGradient(colors: colors)
                                : null,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: colors
                              .map(
                                (e) => Container(
                                  width: 24,
                                  height: 40 / colors.length,
                                  color: e,
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              elevation: 0.5,
              child: SizedBox(
                width: double.infinity,
                child: Wrap(
                  children: [
                    ...colors.map(
                      (color) => Container(
                        margin: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () => onRemoveColor(color),
                          child: Card(
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Center(
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: const BoxDecoration(
                                    color: Colors.white60,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.remove, size: 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      child: Card(
                        child: GestureDetector(
                          onTap: () => onAddColor(colors),
                          child: const SizedBox(
                            width: 40,
                            height: 40,
                            child: Icon(Icons.add, size: 24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
