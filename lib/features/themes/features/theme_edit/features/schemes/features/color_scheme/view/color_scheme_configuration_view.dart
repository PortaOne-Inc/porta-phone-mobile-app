import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

class ColorSchemeConfigurationView extends StatefulWidget {
  const ColorSchemeConfigurationView({super.key});

  @override
  State<ColorSchemeConfigurationView> createState() => _ColorSchemeConfigurationViewState();
}

class _ColorSchemeConfigurationViewState extends State<ColorSchemeConfigurationView> {
  static const _tileConstraints = BoxConstraints.tightFor(width: 180, height: 120);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UpdateThemCubit>();

    final colors = context.select<UpdateThemCubit, List<SchemeColor>>(
      (c) => c.state.colorsScheme,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Color scheme')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(colors.length, (index) {
                    final item = colors[index];
                    final currentColor = item.color ?? Colors.transparent;

                    return ColorField(
                      title: item.schemeKey,
                      color: currentColor,
                      constraints: _tileConstraints,
                      onTap: (picked) async => _selectColor(
                        context,
                        currentColor,
                        (newColor) => bloc.add(
                          UpdateColorSchemeEvent.chane(item.schemeKey, newColor),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectColor(
    BuildContext context,
    Color initial,
    void Function(Color) onSelected,
  ) async {
    final result = await showDialog<Color?>(
      context: context,
      useRootNavigator: false,
      builder: (context) => Center(
        child: ColorPicker(
          initialColor: initial,
          onDeclineColor: () => Navigator.of(context).pop(),
          onAcceptColor: (color) => Navigator.of(context).pop(color),
        ),
      ),
    );

    if (result != null) onSelected(result);
  }
}
