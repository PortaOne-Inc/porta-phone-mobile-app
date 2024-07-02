import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'exclude_color_scheme.dart';

class PreloadPicker extends StatefulWidget {
  const PreloadPicker({
    required this.current,
    this.onSelect,
    this.onDeclineColor,
    super.key,
  });

  final void Function(ColorSchemeModel scheme)? onSelect;
  final void Function()? onDeclineColor;
  final ColorSchemeModel current;

  @override
  State<PreloadPicker> createState() => _PreloadPickerState();
}

class _PreloadPickerState extends State<PreloadPicker> {
  int? _selectedTemplatePosition;

  final _selectedExcludeColorFields = [ColorSchemeKeys.onSurface];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  context.l10n.feature_theme_edit_Template_description,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.only(left: 48),
              child: ExcludeColorScheme(
                selectedSchemeKeys: _selectedExcludeColorFields,
                onUpdate: _onUpdate,
              ),
            ),
            const SizedBox(height: 4),
            const Divider(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 48),
              child: Text(
                context.l10n.feature_theme_edit_Template_dot,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: FlexScheme.values.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
                    child: TextButton(
                      onPressed: () => _onSelectTemplate(index),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Icon(_selectedTemplatePosition == index ? Icons.check_box : Icons.check_box_outline_blank),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              StringExtension(FlexScheme.values[index].name).capitalize,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectTemplate(int index) {
    if (index == _selectedTemplatePosition) {
      _selectedTemplatePosition = null;
      widget.onSelect?.call(widget.current);
    } else {
      _selectedTemplatePosition = index;
      final scheme = _getNewScheme(index);
      widget.onSelect?.call(scheme);
    }
    setState(() {});
  }

  ColorSchemeModel _getNewScheme(int index) {
    final themeColorScheme = FlexThemeData.light(scheme: FlexScheme.values[index]).colorScheme;

    final scheme = ColorSchemeModel(
      primary: _useColorByExclude(
        widget.current.primary,
        themeColorScheme.primary,
        ColorSchemeKeys.primary,
      ),
      onPrimary: _useColorByExclude(
        widget.current.onPrimary,
        themeColorScheme.onPrimary,
        ColorSchemeKeys.onPrimary,
      ),
      primaryContainer: _useColorByExclude(
        widget.current.primaryContainer,
        themeColorScheme.primaryContainer,
        ColorSchemeKeys.primaryContainer,
      ),
      onPrimaryContainer: _useColorByExclude(
        widget.current.onPrimaryContainer,
        themeColorScheme.onPrimaryContainer,
        ColorSchemeKeys.onPrimaryContainer,
      ),
      primaryFixed: _useColorByExclude(
        widget.current.primaryFixed,
        themeColorScheme.primaryFixed,
        ColorSchemeKeys.primaryFixed,
      ),
      primaryFixedDim: _useColorByExclude(
        widget.current.primaryFixedDim,
        themeColorScheme.primaryFixedDim,
        ColorSchemeKeys.primaryFixedDim,
      ),
      onPrimaryFixed: _useColorByExclude(
        widget.current.onPrimaryFixed,
        themeColorScheme.onPrimaryFixed,
        ColorSchemeKeys.onPrimaryFixed,
      ),
      onPrimaryFixedVariant: _useColorByExclude(
        widget.current.onPrimaryFixedVariant,
        themeColorScheme.onPrimaryFixedVariant,
        ColorSchemeKeys.onPrimaryFixedVariant,
      ),
      secondary: _useColorByExclude(
        widget.current.secondary,
        themeColorScheme.secondary,
        ColorSchemeKeys.secondary,
      ),
      onSecondary: _useColorByExclude(
        widget.current.onSecondary,
        themeColorScheme.onSecondary,
        ColorSchemeKeys.onSecondary,
      ),
      secondaryContainer: _useColorByExclude(
        widget.current.secondaryContainer,
        themeColorScheme.secondaryContainer,
        ColorSchemeKeys.secondaryContainer,
      ),
      onSecondaryContainer: _useColorByExclude(
        widget.current.onSecondaryContainer,
        themeColorScheme.onSecondaryContainer,
        ColorSchemeKeys.onSecondaryContainer,
      ),
      secondaryFixed: _useColorByExclude(
        widget.current.secondaryFixed,
        themeColorScheme.secondaryFixed,
        ColorSchemeKeys.secondaryFixed,
      ),
      secondaryFixedDim: _useColorByExclude(
        widget.current.secondaryFixedDim,
        themeColorScheme.secondaryFixedDim,
        ColorSchemeKeys.secondaryFixedDim,
      ),
      onSecondaryFixed: _useColorByExclude(
        widget.current.onSecondaryFixed,
        themeColorScheme.onSecondaryFixed,
        ColorSchemeKeys.onSecondaryFixed,
      ),
      onSecondaryFixedVariant: _useColorByExclude(
        widget.current.onSecondaryFixedVariant,
        themeColorScheme.onSecondaryFixedVariant,
        ColorSchemeKeys.onSecondaryFixedVariant,
      ),
      tertiary: _useColorByExclude(
        widget.current.tertiary,
        themeColorScheme.tertiary,
        ColorSchemeKeys.tertiary,
      ),
      onTertiary: _useColorByExclude(
        widget.current.onTertiary,
        themeColorScheme.onTertiary,
        ColorSchemeKeys.onTertiary,
      ),
      tertiaryContainer: _useColorByExclude(
        widget.current.tertiaryContainer,
        themeColorScheme.tertiaryContainer,
        ColorSchemeKeys.tertiaryContainer,
      ),
      onTertiaryContainer: _useColorByExclude(
        widget.current.onTertiaryContainer,
        themeColorScheme.onTertiaryContainer,
        ColorSchemeKeys.onTertiaryContainer,
      ),
      tertiaryFixed: _useColorByExclude(
        widget.current.tertiaryFixed,
        themeColorScheme.tertiaryFixed,
        ColorSchemeKeys.tertiaryFixed,
      ),
      tertiaryFixedDim: _useColorByExclude(
        widget.current.tertiaryFixedDim,
        themeColorScheme.tertiaryFixedDim,
        ColorSchemeKeys.tertiaryFixedDim,
      ),
      onTertiaryFixed: _useColorByExclude(
        widget.current.onTertiaryFixed,
        themeColorScheme.onTertiaryFixed,
        ColorSchemeKeys.onTertiaryFixed,
      ),
      onTertiaryFixedVariant: _useColorByExclude(
        widget.current.onTertiaryFixedVariant,
        themeColorScheme.onTertiaryFixedVariant,
        ColorSchemeKeys.onTertiaryFixedVariant,
      ),
      error: _useColorByExclude(
        widget.current.error,
        themeColorScheme.error,
        ColorSchemeKeys.error,
      ),
      onError: _useColorByExclude(
        widget.current.onError,
        themeColorScheme.onError,
        ColorSchemeKeys.onError,
      ),
      errorContainer: _useColorByExclude(
        widget.current.errorContainer,
        themeColorScheme.errorContainer,
        ColorSchemeKeys.errorContainer,
      ),
      onErrorContainer: _useColorByExclude(
        widget.current.onErrorContainer,
        themeColorScheme.onErrorContainer,
        ColorSchemeKeys.onErrorContainer,
      ),
      outline: _useColorByExclude(
        widget.current.outline,
        themeColorScheme.outline,
        ColorSchemeKeys.outline,
      ),
      outlineVariant: _useColorByExclude(
        widget.current.outlineVariant,
        themeColorScheme.outlineVariant,
        ColorSchemeKeys.outlineVariant,
      ),
      surface: _useColorByExclude(
        widget.current.surface,
        themeColorScheme.surface,
        ColorSchemeKeys.surface,
      ),
      onSurface: _useColorByExclude(
        widget.current.onSurface,
        themeColorScheme.onSurface,
        ColorSchemeKeys.onSurface,
      ),
      surfaceDim: _useColorByExclude(
        widget.current.surfaceDim,
        themeColorScheme.surfaceDim,
        ColorSchemeKeys.surfaceDim,
      ),
      surfaceBright: _useColorByExclude(
        widget.current.surfaceBright,
        themeColorScheme.surfaceBright,
        ColorSchemeKeys.surfaceBright,
      ),
      surfaceContainerLowest: _useColorByExclude(
        widget.current.surfaceContainerLowest,
        themeColorScheme.surfaceContainerLowest,
        ColorSchemeKeys.surfaceContainerLowest,
      ),
      surfaceContainerLow: _useColorByExclude(
        widget.current.surfaceContainerLow,
        themeColorScheme.surfaceContainerLow,
        ColorSchemeKeys.surfaceContainerLow,
      ),
      surfaceContainer: _useColorByExclude(
        widget.current.surfaceContainer,
        themeColorScheme.surfaceContainer,
        ColorSchemeKeys.surfaceContainer,
      ),
      surfaceContainerHigh: _useColorByExclude(
        widget.current.surfaceContainerHigh,
        themeColorScheme.surfaceContainerHigh,
        ColorSchemeKeys.surfaceContainerHigh,
      ),
      surfaceContainerHighest: _useColorByExclude(
        widget.current.surfaceContainerHighest,
        themeColorScheme.surfaceContainerHighest,
        ColorSchemeKeys.surfaceContainerHighest,
      ),
      onSurfaceVariant: _useColorByExclude(
        widget.current.onSurfaceVariant,
        themeColorScheme.onSurfaceVariant,
        ColorSchemeKeys.onSurfaceVariant,
      ),
      inverseSurface: _useColorByExclude(
        widget.current.inverseSurface,
        themeColorScheme.inverseSurface,
        ColorSchemeKeys.inverseSurface,
      ),
      inversePrimary: _useColorByExclude(
        widget.current.inversePrimary,
        themeColorScheme.inversePrimary,
        ColorSchemeKeys.inversePrimary,
      ),
      shadow: _useColorByExclude(
        widget.current.shadow,
        themeColorScheme.shadow,
        ColorSchemeKeys.shadow,
      ),
      scrim: _useColorByExclude(
        widget.current.scrim,
        themeColorScheme.scrim,
        ColorSchemeKeys.scrim,
      ),
      surfaceTint: _useColorByExclude(
        widget.current.surfaceTint,
        themeColorScheme.surfaceTint,
        ColorSchemeKeys.surfaceTint,
      ),
    );

    return scheme;
  }

  Color? _useColorByExclude(Color? currentColor, Color? newColor, ColorSchemeKeys exclude) {
    return _selectedExcludeColorFields.contains(exclude) ? currentColor : newColor;
  }

  void _onUpdate() {
    if (_selectedTemplatePosition == null) {
      widget.onSelect?.call(widget.current);
    } else {
      final scheme = _getNewScheme(_selectedTemplatePosition!);
      widget.onSelect?.call(scheme);
    }
  }
}
