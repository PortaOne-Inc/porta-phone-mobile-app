import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import '../../../../../bloc/update_theme_cubit.dart';

class ContainerConfigTab extends StatelessWidget {
  const ContainerConfigTab({required this.decorationConfig, super.key});

  final DecorationConfig decorationConfig;

  List<String> get _hexList => decorationConfig
      .primaryGradientColorsConfig
      .colors
      .map((e) => e.color)
      .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BorderContainer(
        title: 'Primary gradient',
        descriptionWidget: DescriptionRow.info(
          'Manage the primary gradient stops. Add, remove, and recolor each stop.',
        ),
        padding: const EdgeInsets.all(16),
        child: GradientEditor(
          colors: _hexList,
          onChanged: (hexColors) {
            context.read<UpdateThemCubit>().add(
              ThemeWidgetEvent.setPrimaryGradientColors(
                hexColors.map((h) => CustomColor(color: h)).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
