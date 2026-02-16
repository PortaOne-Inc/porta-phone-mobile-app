import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/widgets/widgets.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import '../../../../../bloc/update_theme_cubit.dart';

class ButtonConfigTab extends StatelessWidget {
  const ButtonConfigTab({
    required this.sourceButtonWidgetConfig,
    this.elevatedButtonStyles,
    super.key,
  });

  final ButtonWidgetConfig sourceButtonWidgetConfig;
  final ElevatedButtonStyles? elevatedButtonStyles;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateThemCubit>();
    final pe = sourceButtonWidgetConfig.primaryElevatedButton;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: BorderContainer(
        title: 'Primary Elevated Button',
        descriptionWidget: DescriptionRow.info(
          'Configure the visual properties (colors, geometry, padding) used by the primary elevated button.',
        ),
        padding: const EdgeInsets.all(16),
        child: ButtonStyleConfigEditor(
          label: 'Properties',
          value: pe,
          onChanged: (v) => cubit.add(ThemeWidgetEvent.setPEButton(v)),
          onClear: () => cubit.add(const ThemeWidgetEvent.setPEButton(null)),
        ),
      ),
    );
  }
}
