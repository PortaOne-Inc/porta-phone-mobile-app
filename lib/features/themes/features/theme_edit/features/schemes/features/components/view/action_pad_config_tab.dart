import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import '../../../../../bloc/update_theme_cubit.dart';

class ActionPadConfig extends StatelessWidget {
  const ActionPadConfig({
    required this.source,
    this.actionpadStyles, // kept only for signature compatibility
    super.key,
  });

  final ActionPadWidgetConfig source;
  final ActionpadStyles? actionpadStyles;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UpdateThemCubit>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: BorderContainer(
        title: 'Action Pad Buttons',
        descriptionWidget: DescriptionRow.info(
          'Configure colors for call start, transfer, and backspace actions.',
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BorderContainer(
              title: 'Call Start',
              padding: const EdgeInsets.all(16),
              child: ElevatedButtonConfigEditor(
                value: source.callStart,
                onChanged: (v) => cubit.add(ThemeWidgetEvent.setActionPadCallStart(v)),
              ),
            ),
            const SizedBox(height: 12),
            BorderContainer(
              title: 'Backspace Pressed',
              padding: const EdgeInsets.all(16),
              child: ElevatedButtonConfigEditor(
                value: source.backspacePressed,
                onChanged: (v) => cubit.add(ThemeWidgetEvent.setActionPadBackspacePressed(v)),
              ),
            ),
            const SizedBox(height: 12),
            BorderContainer(
              title: 'Call Transfer',
              padding: const EdgeInsets.all(16),
              child: ElevatedButtonConfigEditor(
                value: source.callTransfer,
                onChanged: (v) => cubit.add(ThemeWidgetEvent.setActionPadTransfer(v)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
