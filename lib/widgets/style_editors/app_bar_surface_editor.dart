import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/style_controls/color_input_control.dart';
import 'package:webtrit_configurator/widgets/style_controls/number_input_control.dart';
import 'package:webtrit_configurator/widgets/border_container.dart';
import 'package:webtrit_configurator/widgets/description_row.dart';

class AppBarSurfaceEditor extends StatelessWidget {
  const AppBarSurfaceEditor({
    required this.appBarBlurredSurface,
    required this.onAppBarBlurredSurfaceChanged,
    super.key,
  });

  final BlurredSurfaceConfig? appBarBlurredSurface;
  final ValueChanged<BlurredSurfaceConfig?> onAppBarBlurredSurfaceChanged;

  @override
  Widget build(BuildContext context) {
    final blurConfig = appBarBlurredSurface ?? const BlurredSurfaceConfig();

    return BorderContainer(
      title: 'AppBar',
      descriptionWidget: DescriptionRow.info('Configure AppBar blur effect.'),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Blurred Surface',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          Text(
            'Frosted glass effect for the AppBar.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 12),
          ColorInput(
            label: 'Overlay Color',
            color: blurConfig.color?.toColor(),
            onTap: () => _pickColor(
              context,
              blurConfig.color?.toColor(),
              (hex) => onAppBarBlurredSurfaceChanged(
                blurConfig.copyWith(color: hex),
              ),
            ),
            onClear: () => onAppBarBlurredSurfaceChanged(
              blurConfig.copyWith(color: null),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: NumberInputControl(
                  label: 'Sigma X',
                  value: blurConfig.sigmaX,
                  onChanged: (v) => onAppBarBlurredSurfaceChanged(
                    blurConfig.copyWith(sigmaX: v ?? 0),
                  ),
                  tooltip: 'Horizontal gaussian blur sigma',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: NumberInputControl(
                  label: 'Sigma Y',
                  value: blurConfig.sigmaY,
                  onChanged: (v) => onAppBarBlurredSurfaceChanged(
                    blurConfig.copyWith(sigmaY: v ?? 0),
                  ),
                  tooltip: 'Vertical gaussian blur sigma',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickColor(
    BuildContext context,
    Color? current,
    ValueChanged<String> onPick,
  ) async {
    final picked = await context.showColorPicker(currentColor: current);
    if (context.mounted && picked != null) {
      onPick(picked.toHex(includeAlpha: true));
    }
  }
}
