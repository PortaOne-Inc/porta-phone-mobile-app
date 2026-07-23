import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/bloc/update_theme_cubit.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

import 'leading_avatar_editors.dart';
import 'statuses_config_tab.dart';

/// Groups every indicator/status color in one place with inner sub-tabs, so an
/// admin can see how the avatar badges relate to the connection statuses and
/// stop confusing the presence dot with the registration colors.
class IndicatorsStatusesConfigTab extends StatelessWidget {
  const IndicatorsStatusesConfigTab({required this.imageAssetsConfig, required this.statusesWidgetConfig, super.key});

  final ImageAssetsConfig imageAssetsConfig;
  final StatusesWidgetConfig statusesWidgetConfig;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Avatar indicators'),
              Tab(text: 'Connection statuses'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: _AvatarIndicatorsSection(value: imageAssetsConfig.leadingAvatarStyle),
                ),
                SingleChildScrollView(child: StatusesConfigTab(sourceStatusesWidgetConfig: statusesWidgetConfig)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AvatarIndicatorsSection extends StatelessWidget {
  const _AvatarIndicatorsSection({required this.value});

  final LeadingAvatarStyleConfig value;

  void _update(BuildContext context, LeadingAvatarStyleConfig config) {
    context.read<UpdateThemCubit>().add(ThemeWidgetEvent.setLeadingAvatarStyle(config));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionRow.info(
          'Dots drawn on contact avatars. Only one is shown per avatar: the presence (availability) dot '
          'when the server supports presence, otherwise the registration badge.',
        ),
        const SizedBox(height: 16),
        PresenceBadgeSettings(
          value: value.presenceBadge ?? const PresenceBadgeStyleConfig(),
          onChanged: (badge) => _update(context, value.copyWith(presenceBadge: badge)),
        ),
        const SizedBox(height: 24),
        RegisteredBadgeSettings(
          value: value.registeredBadge ?? const RegisteredBadgeStyleConfig(),
          onChanged: (badge) => _update(context, value.copyWith(registeredBadge: badge)),
        ),
        const SizedBox(height: 24),
        SmartIndicatorSettings(
          value: value.smartIndicator ?? const SmartIndicatorStyleConfig(),
          onChanged: (smart) => _update(context, value.copyWith(smartIndicator: smart)),
        ),
      ],
    );
  }
}
