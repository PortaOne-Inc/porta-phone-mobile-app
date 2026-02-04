import 'package:flutter/material.dart';

import 'package:webtrit_phone/extensions/iterable.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class SupportedConfigWidget extends StatelessWidget {
  const SupportedConfigWidget({
    required this.supportedFeatures,
    required this.onChanged,
    super.key,
  });

  final List<SupportedFeature> supportedFeatures;
  final ValueChanged<List<SupportedFeature>> onChanged;

  @override
  Widget build(BuildContext context) {
    final themeFeature = supportedFeatures.firstWhereOrNull((e) => e is SupportedThemeMode) as SupportedThemeMode?;
    final videoFeature = supportedFeatures.firstWhereOrNull((e) => e is SupportedVideoCall) as SupportedVideoCall?;

    final currentThemeMode = themeFeature?.mode ?? ThemeModeConfig.system;
    final isVideoEnabled = videoFeature?.enabled ?? true;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'Global App Configuration',
          descriptionWidget: DescriptionRow.info(
            'Control global feature flags and app-wide behavior.',
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ThemeModeSelector(
                labelText: 'Forced Theme Mode',
                helperText: 'System (Auto) = Follow OS settings',
                mode: currentThemeMode,
                onChanged: _onThemeModeChanged,
              ),
              const SizedBox(height: 16),
              const Divider(),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Enable Video Calling'),
                subtitle: const Text('Global switch to allow video call features.'),
                value: isVideoEnabled,
                onChanged: _onVideoCallChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onThemeModeChanged(ThemeModeConfig newMode) {
    final newList = List<SupportedFeature>.from(supportedFeatures)
      ..removeWhere((e) => e is SupportedThemeMode)
      ..add(SupportedFeature.themeMode(mode: newMode));

    onChanged(newList);
  }

  void _onVideoCallChanged(bool enabled) {
    final newList = List<SupportedFeature>.from(supportedFeatures)
      ..removeWhere((e) => e is SupportedVideoCall)
      ..add(SupportedFeature.videoCall(enabled: enabled));

    onChanged(newList);
  }
}
