import 'package:flutter/material.dart';
import 'package:webtrit_phone/extensions/extensions.dart';

import '../../../../../../../../core/exports/webtrit_phone.dart';

class SettingsConfigWidget extends StatefulWidget {
  const SettingsConfigWidget({
    required this.config,
    super.key,
  });

  final AppConfigSettings config;

  @override
  _SettingsConfigWidgetState createState() => _SettingsConfigWidgetState();
}

class _SettingsConfigWidgetState extends State<SettingsConfigWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.config.sections.length,
      itemBuilder: (context, sectionIndex) {
        final section = widget.config.sections[sectionIndex];

        return Visibility(
          visible: section.enabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  section.titleL10n,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ...section.items.map((item) {
                return Visibility(
                  visible: true,
                  child: ListTile(
                    leading: Icon(item.icon.toIconData()),
                    title: Text(item.titleL10n),
                    trailing: Switch(
                      value: item.enabled,
                      onChanged: (value) {
                        setState(() {
                          // item.enabled = value;
                        });
                        print("${item.titleL10n} is now ${value ? "enabled" : "disabled"}");
                      },
                    ),
                    onTap: () {
                      if (item.enabled) {
                        // Handle navigation or action
                      }
                    },
                  ),
                );
              }).toList(),
              const Divider(),
            ],
          ),
        );
      },
    );
  }
}
