import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart';

import '../features/settings_main/settings_main.dart';

class SettingsPageTabbedView extends StatelessWidget {
  const SettingsPageTabbedView({required this.config, super.key});

  final SettingsPageConfig config;

  @override
  Widget build(BuildContext context) {
    const tabs = <Tab>[Tab(text: 'Main Screen')];

    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          const TabBar(isScrollable: true, tabs: tabs),
          const SizedBox(height: 12),
          Expanded(
            child: TabBarView(
              children: [
                SettingsMainScreenTab(
                  config: config,
                  onChanged: (SettingsPageConfig value) {
                    context.read<UpdateThemCubit>().add(
                      ThemePageEvent.setSettingsPage(value),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
