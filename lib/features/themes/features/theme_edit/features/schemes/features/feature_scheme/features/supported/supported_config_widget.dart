import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_phone/extensions/iterable.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class SupportedConfigWidget extends StatefulWidget {
  const SupportedConfigWidget({
    required this.supportedFeatures,
    required this.onChanged,
    super.key,
  });

  final List<SupportedFeature> supportedFeatures;
  final ValueChanged<List<SupportedFeature>> onChanged;

  @override
  State<SupportedConfigWidget> createState() => _SupportedConfigWidgetState();
}

class _SupportedConfigWidgetState extends State<SupportedConfigWidget> {
  late TextEditingController _monitorIntervalController;

  @override
  void initState() {
    super.initState();
    final currentInterval = _getMonitorInterval(widget.supportedFeatures);
    _monitorIntervalController = TextEditingController(text: currentInterval.toString());
  }

  @override
  void didUpdateWidget(covariant SupportedConfigWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldInterval = _getMonitorInterval(oldWidget.supportedFeatures);
    final newInterval = _getMonitorInterval(widget.supportedFeatures);

    if (oldInterval != newInterval && _monitorIntervalController.text != newInterval.toString()) {
      _monitorIntervalController.text = newInterval.toString();
    }
  }

  @override
  void dispose() {
    _monitorIntervalController.dispose();
    super.dispose();
  }

  int _getMonitorInterval(List<SupportedFeature> features) {
    final monitorFeature = features.firstWhereOrNull((e) => e is SupportedMonitorConfig) as SupportedMonitorConfig?;
    return monitorFeature?.checkIntervalSec ?? 15;
  }

  @override
  Widget build(BuildContext context) {
    final themeFeature =
        widget.supportedFeatures.firstWhereOrNull((e) => e is SupportedThemeMode) as SupportedThemeMode?;
    final videoFeature =
        widget.supportedFeatures.firstWhereOrNull((e) => e is SupportedVideoCall) as SupportedVideoCall?;
    final systemNotificationsFeature = widget.supportedFeatures
        .firstWhereOrNull((e) => e is SupportedSystemNotifications) as SupportedSystemNotifications?;
    final sipPresenceFeature =
        widget.supportedFeatures.firstWhereOrNull((e) => e is SupportedSipPresence) as SupportedSipPresence?;

    final currentThemeMode = themeFeature?.mode ?? ThemeModeConfig.system;
    final isVideoEnabled = videoFeature?.enabled ?? true;
    final isSystemNotificationsEnabled = systemNotificationsFeature?.enabled ?? true;
    final isSipPresenceEnabled = sipPresenceFeature?.enabled ?? false;

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
              const Divider(),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Enable System Notifications'),
                subtitle: const Text('Global switch to allow system push notifications.'),
                value: isSystemNotificationsEnabled,
                onChanged: _onSystemNotificationsChanged,
              ),
              const Divider(),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Enable SIP Presence'),
                subtitle: const Text('Global switch to allow SIP presence monitoring.'),
                value: isSipPresenceEnabled,
                onChanged: _onSipPresenceChanged,
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 16),
              TextFormField(
                controller: _monitorIntervalController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'RTC Monitor Check Interval (sec)',
                  helperText: 'Defines how often the RTP traffic monitor checks for traffic.',
                  border: OutlineInputBorder(),
                ),
                onChanged: _onMonitorInputChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onThemeModeChanged(ThemeModeConfig newMode) {
    final newList = List<SupportedFeature>.from(widget.supportedFeatures)
      ..removeWhere((e) => e is SupportedThemeMode)
      ..add(SupportedFeature.themeMode(mode: newMode));

    widget.onChanged(newList);
  }

  void _onVideoCallChanged(bool enabled) {
    final newList = List<SupportedFeature>.from(widget.supportedFeatures)
      ..removeWhere((e) => e is SupportedVideoCall)
      ..add(SupportedFeature.videoCall(enabled: enabled));

    widget.onChanged(newList);
  }

  void _onSystemNotificationsChanged(bool enabled) {
    final newList = List<SupportedFeature>.from(widget.supportedFeatures)
      ..removeWhere((e) => e is SupportedSystemNotifications)
      ..add(SupportedFeature.systemNotifications(enabled: enabled));

    widget.onChanged(newList);
  }

  void _onSipPresenceChanged(bool enabled) {
    final newList = List<SupportedFeature>.from(widget.supportedFeatures)
      ..removeWhere((e) => e is SupportedSipPresence)
      ..add(SupportedFeature.sipPresence(enabled: enabled));

    widget.onChanged(newList);
  }

  void _onMonitorInputChanged(String value) {
    final interval = int.tryParse(value) ?? 15;
    _onMonitorConfigChanged(interval);
  }

  void _onMonitorConfigChanged(int interval) {
    final newList = List<SupportedFeature>.from(widget.supportedFeatures)
      ..removeWhere((e) => e is SupportedMonitorConfig)
      ..add(SupportedFeature.monitorConfig(checkIntervalSec: interval));

    widget.onChanged(newList);
  }
}
