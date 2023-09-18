import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/localization/localization.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'exclude_color_scheme.dart';

class PreloadPicker extends StatefulWidget {
  const PreloadPicker({
    super.key,
    this.onSelect,
    this.onDeclineColor,
    required this.current,
  });

  final Function(ColorSchemeModel scheme)? onSelect;
  final Function()? onDeclineColor;
  final ColorSchemeModel current;

  @override
  State<PreloadPicker> createState() => _PreloadPickerState();
}

class _PreloadPickerState extends State<PreloadPicker> {
  int? _selectedTemplatePosition;

  final _selectedExcludeColorFields = [ColorSchemeKeys.background];

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
      ColorSchemeModel scheme = _getNewScheme(index);
      widget.onSelect?.call(scheme);
    }
    setState(() {});
  }

  ColorSchemeModel _getNewScheme(int index) {
    final themeColorScheme = FlexThemeData.light(scheme: FlexScheme.values[index]).colorScheme;
    //TODO: Improve this part
    final scheme = ColorSchemeModel(
      primary: _useColorByExclude(
        widget.current.primary,
        themeColorScheme.primary,
        ColorSchemeKeys.primary,
      ),
      onPrimary: _useColorByExclude(
        widget.current.onPrimary,
        themeColorScheme.onPrimary,
        ColorSchemeKeys.onPrimaryContainer,
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
        ColorSchemeKeys.error,
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
      background: _useColorByExclude(
        widget.current.background,
        themeColorScheme.background,
        ColorSchemeKeys.background,
      ),
      onBackground: _useColorByExclude(
        widget.current.onBackground,
        themeColorScheme.onBackground,
        ColorSchemeKeys.onBackground,
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
      surfaceVariant: _useColorByExclude(
        widget.current.surfaceVariant,
        themeColorScheme.surfaceVariant,
        ColorSchemeKeys.surfaceVariant,
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
      ColorSchemeModel scheme = _getNewScheme(_selectedTemplatePosition!);
      widget.onSelect?.call(scheme);
    }
  }
}
