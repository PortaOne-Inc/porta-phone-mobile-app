import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webtrit_phone/extensions/iterable.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class SupportedConfigWidget extends StatefulWidget {
  const SupportedConfigWidget({required this.supportedFeatures, required this.onChanged, super.key});

  final List<SupportedFeature> supportedFeatures;
  final ValueChanged<List<SupportedFeature>> onChanged;

  @override
  State<SupportedConfigWidget> createState() => _SupportedConfigWidgetState();
}

class _SupportedConfigWidgetState extends State<SupportedConfigWidget> {
  static const _logLevels = ['ALL', 'FINEST', 'FINER', 'FINE', 'CONFIG', 'INFO', 'WARNING', 'SEVERE', 'SHOUT', 'OFF'];

  late TextEditingController _monitorIntervalController;

  @override
  void initState() {
    super.initState();
    final loggingConfig = _getLoggingConfig(widget.supportedFeatures);
    _monitorIntervalController = TextEditingController(text: loggingConfig.checkIntervalSec.toString());
  }

  @override
  void didUpdateWidget(covariant SupportedConfigWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldConfig = _getLoggingConfig(oldWidget.supportedFeatures);
    final newConfig = _getLoggingConfig(widget.supportedFeatures);

    if (oldConfig.checkIntervalSec != newConfig.checkIntervalSec &&
        _monitorIntervalController.text != newConfig.checkIntervalSec.toString()) {
      _monitorIntervalController.text = newConfig.checkIntervalSec.toString();
    }
  }

  @override
  void dispose() {
    _monitorIntervalController.dispose();
    super.dispose();
  }

  SupportedLoggingConfig _getLoggingConfig(List<SupportedFeature> features) {
    final feature = features.firstWhereOrNull((e) => e is SupportedLoggingConfig) as SupportedLoggingConfig?;
    return feature ?? const SupportedLoggingConfig();
  }

  @override
  Widget build(BuildContext context) {
    final themeFeature =
        widget.supportedFeatures.firstWhereOrNull((e) => e is SupportedThemeMode) as SupportedThemeMode?;
    final videoFeature =
        widget.supportedFeatures.firstWhereOrNull((e) => e is SupportedVideoCall) as SupportedVideoCall?;
    final systemNotificationsFeature =
        widget.supportedFeatures.firstWhereOrNull((e) => e is SupportedSystemNotifications)
            as SupportedSystemNotifications?;
    final hybridPresenceFeature =
        widget.supportedFeatures.firstWhereOrNull((e) => e is SupportedHybridPresence) as SupportedHybridPresence?;
    final loggingConfig = _getLoggingConfig(widget.supportedFeatures);

    final currentThemeMode = themeFeature?.mode ?? ThemeModeConfig.system;
    final isVideoEnabled = videoFeature?.enabled ?? false;
    final isSystemNotificationsEnabled = systemNotificationsFeature?.enabled ?? false;
    final isHybridPresenceEnabled = hybridPresenceFeature?.enabled ?? false;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        BorderContainer(
          title: 'Global App Configuration',
          descriptionWidget: DescriptionRow.info('Control global feature flags and app-wide behavior.'),
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
                title: const Text('Enable Hybrid Presence'),
                subtitle: const Text('Global switch to allow hybrid presence (SIP + BLF) monitoring.'),
                value: isHybridPresenceEnabled,
                onChanged: _onHybridPresenceChanged,
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _logLevels.contains(loggingConfig.logLevel) ? loggingConfig.logLevel : 'INFO',
                decoration: const InputDecoration(
                  labelText: 'Log Level',
                  helperText: 'Controls the application log level.',
                  border: OutlineInputBorder(),
                ),
                items: _logLevels.map((level) => DropdownMenuItem(value: level, child: Text(level))).toList(),
                onChanged: (value) {
                  if (value != null) {
                    _onLoggingConfigChanged(
                      logLevel: value,
                      checkIntervalSec: loggingConfig.checkIntervalSec,
                      anonymizationEnabled: loggingConfig.anonymizationEnabled,
                    );
                  }
                },
              ),
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
                onChanged: (value) {
                  final interval = int.tryParse(value) ?? 15;
                  _onLoggingConfigChanged(
                    logLevel: loggingConfig.logLevel,
                    checkIntervalSec: interval,
                    anonymizationEnabled: loggingConfig.anonymizationEnabled,
                  );
                },
              ),
              const Divider(),
              SwitchListTile.adaptive(
                contentPadding: EdgeInsets.zero,
                title: const Text('Enable Log Anonymization'),
                subtitle: const Text('Masks personal data (phone numbers, names) in logs.'),
                value: loggingConfig.anonymizationEnabled,
                onChanged: (value) => _onLoggingConfigChanged(
                  logLevel: loggingConfig.logLevel,
                  checkIntervalSec: loggingConfig.checkIntervalSec,
                  anonymizationEnabled: value,
                ),
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

  void _onHybridPresenceChanged(bool enabled) {
    final newList = List<SupportedFeature>.from(widget.supportedFeatures)
      ..removeWhere((e) => e is SupportedHybridPresence)
      ..add(SupportedFeature.hybridPresence(enabled: enabled));

    widget.onChanged(newList);
  }

  void _onLoggingConfigChanged({
    required String logLevel,
    required int checkIntervalSec,
    required bool anonymizationEnabled,
  }) {
    final newList = List<SupportedFeature>.from(widget.supportedFeatures)
      ..removeWhere((e) => e is SupportedLoggingConfig)
      ..add(
        SupportedFeature.loggingConfig(
          logLevel: logLevel,
          checkIntervalSec: checkIntervalSec,
          anonymizationEnabled: anonymizationEnabled,
        ),
      );

    widget.onChanged(newList);
  }
}
