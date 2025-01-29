import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_phone/theme/styles/styles.dart';

typedef StatusesWidgetConfigConfigCallback = void Function(StatusesWidgetConfig);

class StatusesConfigTab extends StatelessWidget {
  const StatusesConfigTab({
    required this.sourceStatusesWidgetConfig,
    required this.callback,
    this.callStatusStyles,
    this.registeredStatusStyles,
    super.key,
  });

  final StatusesWidgetConfig sourceStatusesWidgetConfig;
  final CallStatusStyles? callStatusStyles;
  final RegisteredStatusStyles? registeredStatusStyles;
  final StatusesWidgetConfigConfigCallback callback;

  @override
  Widget build(BuildContext context) {
    final light = ThemeProvider.of(context).light();
    final callStatusStyles = light.extension<CallStatusStyles>()?.primary;
    final registeredStatusStyles = light.extension<RegisteredStatusStyles>()?.primary;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatusSection(
            title: 'Registration Statuses',
            statuses: [
              StatusDescriptor(
                title: 'Registered',
                color: registeredStatusStyles?.registered,
                onColorSelected: (color) => _updateRegisteredStyles(registeredColor: color.toHex()),
              ),
              StatusDescriptor(
                title: 'Unregistered',
                color: registeredStatusStyles?.unregistered,
                onColorSelected: (color) => _updateRegisteredStyles(unregisteredColor: color.toHex()),
              ),
            ],
          ),
          const SizedBox(height: 16),
          StatusSection(
            title: 'Call Statuses',
            statuses: [
              StatusDescriptor(
                title: 'Connectivity None',
                color: callStatusStyles?.connectivityNone,
                onColorSelected: (color) => _updateCallStyles(connectivityNoneColor: color.toHex()),
              ),
              StatusDescriptor(
                title: 'Connect Error',
                color: callStatusStyles?.connectError,
                onColorSelected: (color) => _updateCallStyles(connectErrorColor: color.toHex()),
              ),
              StatusDescriptor(
                title: 'App Unregistered',
                color: callStatusStyles?.appUnregistered,
                onColorSelected: (color) => _updateCallStyles(appUnregisteredColor: color.toHex()),
              ),
              StatusDescriptor(
                title: 'Connect Issue',
                color: callStatusStyles?.connectIssue,
                onColorSelected: (color) => _updateCallStyles(connectIssueColor: color.toHex()),
              ),
              StatusDescriptor(
                title: 'In Progress',
                color: callStatusStyles?.inProgress,
                onColorSelected: (color) => _updateCallStyles(inProgressColor: color.toHex()),
              ),
              StatusDescriptor(
                title: 'Ready',
                color: callStatusStyles?.ready,
                onColorSelected: (color) => _updateCallStyles(readyColor: color.toHex()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateRegisteredStyles({String? registeredColor, String? unregisteredColor}) {
    final updatedStyles = sourceStatusesWidgetConfig.registrationStatuses.copyWith(
      online: registeredColor ?? sourceStatusesWidgetConfig.registrationStatuses.online,
      offline: unregisteredColor ?? sourceStatusesWidgetConfig.registrationStatuses.offline,
    );
    callback.call(sourceStatusesWidgetConfig.copyWith(registrationStatuses: updatedStyles));
  }

  void _updateCallStyles({
    String? connectivityNoneColor,
    String? connectErrorColor,
    String? appUnregisteredColor,
    String? connectIssueColor,
    String? inProgressColor,
    String? readyColor,
  }) {
    final updatedStyles = sourceStatusesWidgetConfig.callStatuses.copyWith(
      connectivityNone: connectivityNoneColor ?? sourceStatusesWidgetConfig.callStatuses.connectivityNone,
      connectError: connectErrorColor ?? sourceStatusesWidgetConfig.callStatuses.connectError,
      appUnregistered: appUnregisteredColor ?? sourceStatusesWidgetConfig.callStatuses.appUnregistered,
      connectIssue: connectIssueColor ?? sourceStatusesWidgetConfig.callStatuses.connectIssue,
      inProgress: inProgressColor ?? sourceStatusesWidgetConfig.callStatuses.inProgress,
      ready: readyColor ?? sourceStatusesWidgetConfig.callStatuses.ready,
    );
    callback.call(sourceStatusesWidgetConfig.copyWith(callStatuses: updatedStyles));
  }
}

class StatusSection extends StatelessWidget {
  const StatusSection({
    required this.title,
    required this.statuses,
    super.key,
  });

  final String title;
  final List<StatusDescriptor> statuses;

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: title,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: statuses.map((status) {
          return ColorField(
            constraints: const BoxConstraints(minWidth: 160, minHeight: 80),
            title: status.title,
            color: status.color,
            onTap: (color) => context.selectColor(
              initialColor: status.color,
              onColorSelected: status.onColorSelected,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class StatusDescriptor {
  const StatusDescriptor({
    required this.title,
    required this.color,
    required this.onColorSelected,
  });

  final String title;
  final Color? color;
  final ValueChanged<Color> onColorSelected;
}
