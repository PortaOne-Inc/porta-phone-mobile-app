import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/core.dart';
import '../widgets/widgets.dart';

class ContainerConfigTab extends StatelessWidget {
  const ContainerConfigTab({
    required this.decorationConfig,
    required this.gradients,
    required this.callback,
    super.key,
  });

  final DecorationConfig decorationConfig;
  final Gradients? gradients;
  final ObjectCallback<DecorationConfig> callback;

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
              colors: gradients?.tab?.colors ?? [],
              onRemoveColor: (color) {
                final updatedColors = (gradients?.tab?.colors ?? []).where((c) => c != color).toList();
                callback(decorationConfig.copyWith(
                  primaryGradientColorsConfig: decorationConfig.primaryGradientColorsConfig.copyWith(
                    colors: updatedColors.map((it) => CustomColor(color: it.toHex())).toList(),
                  ),
                ));
              },
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: (gradients?.tab?.colors ?? [])
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
