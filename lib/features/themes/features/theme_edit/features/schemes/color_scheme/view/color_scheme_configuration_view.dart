import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';

import '../../../../bloc/update_theme_cubit.dart';
import '../widgets/color_scheme_action_bar.dart';

class ColorSchemeConfigurationView extends StatefulWidget {
  const ColorSchemeConfigurationView({super.key});

  @override
  State<ColorSchemeConfigurationView> createState() => _ColorSchemeConfigurationViewState();
}

class _ColorSchemeConfigurationViewState extends State<ColorSchemeConfigurationView> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<UpdateThemCubit>();

    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (ctx, state) => Column(
        children: [
          ColorSchemeActionBar(onBack: () {
            GoRouter.of(context).pop();
          }),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: List.generate(
                    state.colorsScheme.length,
                    (index) => ColorField(
                      title: state.colorsScheme[index].key,
                      color: state.colorsScheme[index].value,
                      onTap: (color) async => _selectColor(
                        context,
                        color,
                        (color) => bloc.add(UpdateColorSchemeEvent.chane(state.colorsScheme[index].key, color)),
                      ),
                      constraints: const BoxConstraints.tightFor(width: 180, height: 120),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _selectColor(BuildContext context, Color color, void Function(Color) callback) async {
    final result = await showDialog<Color?>(
        context: context,
        builder: (context) => Center(
              child: ColorPicker(
                onDeclineColor: () => Navigator.of(context).pop(),
                onAcceptColor: (color) => Navigator.of(context).pop(color),
                initialColor: color,
              ),
            ),
        useRootNavigator: false);
    if (result is Color) callback(result);
  }
}
