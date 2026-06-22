import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

class StatusesConfigTab extends StatelessWidget {
  const StatusesConfigTab({required this.sourceStatusesWidgetConfig, super.key});

  final StatusesWidgetConfig sourceStatusesWidgetConfig;

  @override
  Widget build(BuildContext context) {
    // Read colors from the source config, not the built theme extensions, so the
    // configurator always shows the actual configured value.
    final registration = sourceStatusesWidgetConfig.registrationStatuses;
    final call = sourceStatusesWidgetConfig.callStatuses;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatusSection(
            title: 'Registration statuses',
            descriptionWidget: DescriptionRow.info('Colors for registered/unregistered account states.'),
            statuses: [
              StatusDescriptor(
                title: 'Registered',
                color: registration.online.toColor(),
                onColorSelected: (c) {
                  if (c != null) {
                    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setRegistrationOnline(c.toHex()));
                  }
                },
              ),
              StatusDescriptor(
                title: 'Unregistered',
                color: registration.offline.toColor(),
                onColorSelected: (c) {
                  if (c != null) {
                    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setRegistrationOffline(c.toHex()));
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          StatusSection(
            title: 'Call statuses',
            descriptionWidget: DescriptionRow.info('Connection and call lifecycle indicators.'),
            statuses: [
              StatusDescriptor(
                title: 'Connectivity none',
                color: call.connectivityNone.toColor(),
                onColorSelected: (c) {
                  if (c != null) {
                    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setCallStatusesConnectivityNone(c.toHex()));
                  }
                },
              ),
              StatusDescriptor(
                title: 'Connect error',
                color: call.connectError.toColor(),
                onColorSelected: (c) {
                  if (c != null) {
                    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setCallStatusesConnectError(c.toHex()));
                  }
                },
              ),
              StatusDescriptor(
                title: 'App unregistered',
                color: call.appUnregistered.toColor(),
                onColorSelected: (c) {
                  if (c != null) {
                    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setCallStatusesAppUnregistered(c.toHex()));
                  }
                },
              ),
              StatusDescriptor(
                title: 'Connect issue',
                color: call.connectIssue.toColor(),
                onColorSelected: (c) {
                  if (c != null) {
                    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setCallStatusesConnectIssue(c.toHex()));
                  }
                },
              ),
              StatusDescriptor(
                title: 'In progress',
                color: call.inProgress.toColor(),
                onColorSelected: (c) {
                  if (c != null) {
                    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setCallStatusesInProgress(c.toHex()));
                  }
                },
              ),
              StatusDescriptor(
                title: 'Ready',
                color: call.ready.toColor(),
                onColorSelected: (c) {
                  if (c != null) {
                    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setCallStatusesReady(c.toHex()));
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StatusSection extends StatelessWidget {
  const StatusSection({required this.title, required this.statuses, this.descriptionWidget, super.key});

  final String title;
  final List<StatusDescriptor> statuses;
  final Widget? descriptionWidget;

  Future<void> _pickColor(BuildContext context, StatusDescriptor status) async {
    final newColor = await context.showColorPicker(currentColor: status.color);
    if (newColor != null) {
      status.onColorSelected(newColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BorderContainer(
      title: title,
      descriptionWidget: descriptionWidget,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: statuses.map((status) {
          return SizedBox(
            width: 200,
            child: ColorInput(
              label: status.title,
              color: status.color,
              onTap: () => _pickColor(context, status),
              onClear: () => status.onColorSelected(null),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class StatusDescriptor {
  const StatusDescriptor({required this.title, required this.color, required this.onColorSelected});

  final String title;
  final Color? color;
  final ValueChanged<Color?> onColorSelected;
}
