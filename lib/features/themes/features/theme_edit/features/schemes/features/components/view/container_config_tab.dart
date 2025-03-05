import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import '../widgets/widgets.dart';
import 'package:webtrit_configurator/exports/exports.dart';

class ContainerConfigTab extends StatelessWidget {
  const ContainerConfigTab({
    required this.decorationConfig,
    required this.callback,
    super.key,
  });

  final DecorationConfig decorationConfig;
  final ObjectCallback<DecorationConfig> callback;

  List<Color> get gradients =>
      decorationConfig.primaryGradientColorsConfig.colors.map((it) => it.color.toColor()).toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BorderContainer(
        title: 'PrimaryGradientColorsConfig',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientField(
              colors: gradients,
              onAddColor: (List<Color?> colors) {
                context.selectColor(
                  initialColor: Colors.white,
                  onColorSelected: (color) {
                    callback(decorationConfig.copyWith(
                      primaryGradientColorsConfig: decorationConfig.primaryGradientColorsConfig.copyWith(
                        colors: [...colors, color].nonNulls.map((it) => CustomColor(color: it.toHex())).toList(),
                      ),
                    ));
                  },
                );
              },
              onRemoveColor: (color) {
                final colors = List<Color>.from(gradients);
                final index = colors.indexWhere((c) => c == color);

                if (index != -1) {
                  colors.removeAt(index);
                }

                callback(decorationConfig.copyWith(
                  primaryGradientColorsConfig: decorationConfig.primaryGradientColorsConfig.copyWith(
                    colors: colors.map((it) => CustomColor(color: it.toHex())).toList(),
                  ),
                ));
              },
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: gradients
                  .map(
                    (color) => ColorField(
                      constraints: const BoxConstraints(minWidth: 140, minHeight: 60),
                      title: 'color',
                      color: color,
                      onTap: (color) async {},
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
