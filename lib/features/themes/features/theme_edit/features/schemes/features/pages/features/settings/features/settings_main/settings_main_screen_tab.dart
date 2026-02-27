import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class SettingsMainScreenTab extends StatelessWidget {
  const SettingsMainScreenTab({
    required this.config,
    required this.onChanged,
    super.key,
  });

  final SettingsPageConfig config;
  final ValueChanged<SettingsPageConfig> onChanged;

  @override
  Widget build(BuildContext context) {
    final groupConfig =
        config.groupTitleListTile ?? const GroupTitleListTileWidgetConfig();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ThemeOverrideSelector(
          config: config.themeOverride,
          onChanged: (value) =>
              onChanged(config.copyWith(themeOverride: value)),
        ),
        const SizedBox(height: 16),

        PageBackgroundEditor(
          value: config.background,
          onChanged: (value) => onChanged(config.copyWith(background: value)),
        ),
        const SizedBox(height: 16),
        AppBarSurfaceEditor(
          appBarBackgroundColor: config.appBarBackgroundColor,
          appBarBlurredSurface: config.appBarBlurredSurface,
          onAppBarBackgroundColorChanged: (v) =>
              onChanged(config.copyWith(appBarBackgroundColor: v)),
          onAppBarBlurredSurfaceChanged: (v) =>
              onChanged(config.copyWith(appBarBlurredSurface: v)),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Layout & Structure',
          descriptionWidget: DescriptionRow.info(
            'Configure the structural appearance of the main settings list.',
          ),
          child: SwitchListTile(
            title: const Text('Show List Separators'),
            subtitle: const Text(
              'Display divider lines between setting items.',
            ),
            value: config.showSeparators,
            onChanged: (v) => onChanged(config.copyWith(showSeparators: v)),
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'List Items Styling',
          descriptionWidget: DescriptionRow.info(
            'Customize typography and iconography for individual setting rows.',
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextStyleConfigEditor(
                label: 'Item Text Style',
                value: config.itemTextStyle,
                onChanged: (newStyle) =>
                    onChanged(config.copyWith(itemTextStyle: newStyle)),
                onClear: () => onChanged(config.copyWith(itemTextStyle: null)),
              ),
              const Divider(height: 32),
              Text(
                'Icon Colors',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 12),
              ColorInput(
                label: 'Leading Icons',
                color: config.leadingIconsColor?.toColor(),
                onTap: () => _pickColor(
                  context,
                  config.leadingIconsColor?.toColor(),
                  (hex) {
                    onChanged(config.copyWith(leadingIconsColor: hex));
                  },
                ),
                onClear: () =>
                    onChanged(config.copyWith(leadingIconsColor: null)),
              ),
              const SizedBox(height: 12),
              ColorInput(
                label: 'User Icon',
                color: config.userIconColor?.toColor(),
                onTap: () =>
                    _pickColor(context, config.userIconColor?.toColor(), (hex) {
                      onChanged(config.copyWith(userIconColor: hex));
                    }),
                onClear: () => onChanged(config.copyWith(userIconColor: null)),
              ),
              const SizedBox(height: 12),
              ColorInput(
                label: 'Logout Icon',
                color: config.logoutIconColor?.toColor(),
                onTap: () => _pickColor(
                  context,
                  config.logoutIconColor?.toColor(),
                  (hex) {
                    onChanged(config.copyWith(logoutIconColor: hex));
                  },
                ),
                onClear: () =>
                    onChanged(config.copyWith(logoutIconColor: null)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        BorderContainer(
          title: 'Group Headers',
          descriptionWidget: DescriptionRow.info(
            'Customize the appearance of section headers (e.g., "Network", "About").',
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorInput(
                label: 'Background Color',
                color: groupConfig.backgroundColor?.toColor(),
                onTap: () => _pickColor(
                  context,
                  groupConfig.backgroundColor?.toColor(),
                  (hex) {
                    onChanged(
                      config.copyWith(
                        groupTitleListTile: groupConfig.copyWith(
                          backgroundColor: hex,
                        ),
                      ),
                    );
                  },
                ),
                onClear: () => onChanged(
                  config.copyWith(
                    groupTitleListTile: groupConfig.copyWith(
                      backgroundColor: null,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextStyleConfigEditor(
                label: 'Header Typography',
                value: groupConfig.textStyle,
                onChanged: (newTextStyle) => onChanged(
                  config.copyWith(
                    groupTitleListTile: groupConfig.copyWith(
                      textStyle: newTextStyle,
                    ),
                  ),
                ),
                onClear: () => onChanged(
                  config.copyWith(
                    groupTitleListTile: groupConfig.copyWith(textStyle: null),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
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
