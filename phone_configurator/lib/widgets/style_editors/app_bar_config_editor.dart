import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import 'icon_theme_editor.dart';

/// A comprehensive editor for [AppBarConfig].
class AppBarConfigEditor extends StatelessWidget {
  const AppBarConfigEditor({
    required this.value,
    required this.onChanged,
    this.description,
    super.key,
  });

  final AppBarConfig value;
  final ValueChanged<AppBarConfig> onChanged;
  final Widget? description;

  void _update(AppBarConfig newValue) => onChanged(newValue);

  Future<void> _pickColor(
    BuildContext context,
    Color? current,
    ValueChanged<String> onApply,
  ) async {
    final newColor = await context.showColorPicker(currentColor: current);
    if (newColor != null) {
      onApply(newColor.toHex());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (description != null) ...[description!, const SizedBox(height: 16)],
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Behavior & Layout', style: theme.textTheme.titleSmall),
                const SizedBox(height: 12),
                SwitchListTile(
                  title: const Text('Primary App Bar'),
                  subtitle: const Text('Render at the top of the screen'),
                  value: value.primary,
                  onChanged: (v) => _update(value.copyWith(primary: v)),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
                SwitchListTile(
                  title: const Text('Center Title'),
                  value: value.centerTitle ?? true,
                  onChanged: (v) => _update(value.copyWith(centerTitle: v)),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
                SwitchListTile(
                  title: const Text('Show Back Button'),
                  value: value.showBackButton,
                  onChanged: (v) => _update(value.copyWith(showBackButton: v)),
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
                const Divider(),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: NumberInputControl(
                        label: 'Elevation',
                        value: value.elevation,
                        onChanged: (v) => _update(value.copyWith(elevation: v)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: NumberInputControl(
                        label: 'Scrolled Elev.',
                        value: value.scrolledUnderElevation,
                        onChanged: (v) =>
                            _update(value.copyWith(scrolledUnderElevation: v)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: NumberInputControl(
                        label: 'Toolbar H',
                        value: value.toolbarHeight,
                        onChanged: (v) =>
                            _update(value.copyWith(toolbarHeight: v)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: NumberInputControl(
                        label: 'Leading W',
                        value: value.leadingWidth,
                        onChanged: (v) =>
                            _update(value.copyWith(leadingWidth: v)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: NumberInputControl(
                        label: 'Title Spacing',
                        value: value.titleSpacing,
                        onChanged: (v) =>
                            _update(value.copyWith(titleSpacing: v)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Colors', style: theme.textTheme.titleSmall),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ColorField(
                      title: 'Background',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.backgroundColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.backgroundColor?.toColor(),
                        (hex) => _update(value.copyWith(backgroundColor: hex)),
                      ),
                    ),
                    ColorField(
                      title: 'Foreground',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.foregroundColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.foregroundColor?.toColor(),
                        (hex) => _update(value.copyWith(foregroundColor: hex)),
                      ),
                    ),
                    ColorField(
                      title: 'Shadow',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.shadowColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.shadowColor?.toColor(),
                        (hex) => _update(value.copyWith(shadowColor: hex)),
                      ),
                    ),
                    ColorField(
                      title: 'Surface Tint',
                      constraints: const BoxConstraints(
                        minWidth: 140,
                        minHeight: 60,
                      ),
                      color: value.surfaceTintColor?.toColor(),
                      onTap: (_) => _pickColor(
                        context,
                        value.surfaceTintColor?.toColor(),
                        (hex) => _update(value.copyWith(surfaceTintColor: hex)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.antiAlias,
          child: ExpansionTile(
            title: const Text('Styles & Themes'),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: [
              IconThemeEditor(
                label: 'Main Icon Theme',
                value: value.iconTheme,
                onChanged: (v) => _update(value.copyWith(iconTheme: v)),
              ),
              const SizedBox(height: 16),
              IconThemeEditor(
                label: 'Actions Icon Theme',
                value: value.actionsIconTheme,
                onChanged: (v) => _update(value.copyWith(actionsIconTheme: v)),
              ),
              const Divider(),
              TextStyleConfigEditor(
                label: 'Title Text Style',
                value: value.titleTextStyle,
                onChanged: (s) => _update(value.copyWith(titleTextStyle: s)),
                onClear: () => _update(value.copyWith(titleTextStyle: null)),
              ),
              const SizedBox(height: 16),
              TextStyleConfigEditor(
                label: 'Toolbar Text Style',
                value: value.toolbarTextStyle,
                onChanged: (s) => _update(value.copyWith(toolbarTextStyle: s)),
                onClear: () => _update(value.copyWith(toolbarTextStyle: null)),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'System UI Overlay',
                  style: theme.textTheme.titleSmall,
                ),
              ),
              const SizedBox(height: 8),
              SystemUiOverlayQuickToggles(
                value: value.systemOverlayStyle,
                onChanged: (v) =>
                    _update(value.copyWith(systemOverlayStyle: v)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
