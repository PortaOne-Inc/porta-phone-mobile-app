import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/features/theme_edit/widgets/color/color.dart';
import 'package:webtrit_configurator/share/entity/models/theme/color_model.dart';

class ColorSchemeWidget extends StatelessWidget {
  final ColorModel? colors;
  final Function(ColorModel? colorModel) updateColor;

  const ColorSchemeWidget({
    super.key,
    this.colors,
    required this.updateColor,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
        children: [
          Row(
            children: [
              Expanded(
                child: ColorField(
                  title: context.l10n.configurator_color_primary,
                  color: colors?.primary,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(primary: color)),
                  ),
                ),
              ),
              Expanded(
                child: ColorField(
                  title: context.l10n.feature_theme_edit_Color_on_primary,
                  color: colors?.onPrimary,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(onPrimary: color)),
                  ),
                ),
              ),
            ],
          ),
          ColorField(
            title: context.l10n.configurator_color_secondary,
            color: colors?.secondary,
            onTap: (color) async => _selectColor(
              context,
              color,
              (color) => updateColor(colors?.copyWith(secondary: color)),
            ),
          ),
          ColorField(
            title: context.l10n.configurator_color_outline,
            color: colors?.outline,
            onTap: (color) async => _selectColor(
              context,
              color,
              (color) => updateColor(colors?.copyWith(outline: color)),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ColorField(
                  title: context.l10n.configurator_color_secondary_container,
                  color: colors?.secondaryContainer,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(secondaryContainer: color)),
                  ),
                ),
              ),
              Expanded(
                child: ColorField(
                  title: context.l10n.configurator_color_on_secondary_container,
                  color: colors?.onSecondaryContainer,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(onSecondaryContainer: color)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ColorField(
                  title: context.l10n.configurator_color_tertiary,
                  color: colors?.tertiary,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(tertiary: color)),
                  ),
                ),
              ),
              Expanded(
                child: ColorField(
                  title: context.l10n.configurator_color_error,
                  color: colors?.error,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(error: color)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ColorField(
                  title: context.l10n.feature_theme_edit_Color_on_background,
                  color: colors?.onBackground,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(onBackground: color)),
                  ),
                ),
              ),
              Expanded(
                child: ColorField(
                  title: context.l10n.configurator_color_background,
                  color: colors?.background,
                  onFocus: (isFocus) {
                    // focusBloc.updateColorBackground(isFocus);
                  },
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(background: color)),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: ColorField(
                  title: context.l10n.configurator_color_surface,
                  color: colors?.surface,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(surface: color)),
                  ),
                ),
              ),
              Expanded(
                child: ColorField(
                  title: context.l10n.configurator_color_on_surface,
                  color: colors?.onSurface,
                  onTap: (color) async => _selectColor(
                    context,
                    color,
                    (color) => updateColor(colors?.copyWith(onSurface: color)),
                  ),
                ),
              ),
            ],
          ),
          // GradientField(
          //   title: context.l10n.configurator_color_gradient_tab,
          //   colors: state.theme.colorGradientCollection,
          //   onAddColor: (colors) async => _addGradientColor(
          //     context,
          //     colors,
          //     bloc.updateGradientTab,
          //   ),
          //   onRemoveColor: (color) {
          //     bloc.updateGradientTab(
          //       (state.theme.colorGradientCollection)
          //           .where(
          //             (element) => element != color,
          //           )
          //           .toList(),
          //     );
          //   },
          // ),
        ],

    );
  }

  void _selectColor(BuildContext context, Color color, Function(Color) callback) async {
    final result = await showDialog(
        context: context,
        builder: (context) => Center(
              child: ColorPicker(
                onDeclineColor: () => Navigator.of(context).pop(),
                onAcceptColor: (color) => Navigator.of(context).pop(color),
                initialColor: Colors.black,
              ),
            ),
        useRootNavigator: false);
    if (result is Color) callback(result);
  }
}
