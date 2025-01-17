import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

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
      builder: (BuildContext context, BoxConstraints constraints) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              child: Card(
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (colors.isEmpty)
                                Text(
                                  'Not colors set yet',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ConstrainedBox(
                                constraints: BoxConstraints(maxWidth: constraints.maxWidth - 48, minHeight: 24),
                                child: Wrap(
                                  children: colors
                                      .map((e) => Text(
                                            '${e.toHex()} ',
                                            style: Theme.of(context).textTheme.labelSmall?.copyWith(color: e),
                                          ))
                                      .toList(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
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
                          const SizedBox(width: 8),
                          Container(
                            width: MediaQuery.of(context).size.width / 10,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: colors.length >= 2 ? LinearGradient(colors: colors) : null,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(4),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              onTap: () {},
            ),
            Card(
              elevation: 0.5,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: colors
                      .map(
                        (e) => Container(
                          margin: const EdgeInsets.all(8),
                          child: GestureDetector(
                            onTap: () => onRemoveColor(e),
                            child: Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: e,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                    bottomRight: Radius.circular(4),
                                    bottomLeft: Radius.circular(4),
                                  ),
                                ),
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: const BoxDecoration(
                                      color: Colors.white60,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(90),
                                        topRight: Radius.circular(90),
                                        bottomRight: Radius.circular(90),
                                        bottomLeft: Radius.circular(90),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList()
                    ..add(
                      Container(
                        margin: const EdgeInsets.all(8),
                        child: Card(
                          child: GestureDetector(
                            child: const SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(
                                Icons.add,
                                size: 24,
                              ),
                            ),
                            onTap: () => onAddColor(colors),
                          ),
                        ),
                      ),
                    ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
