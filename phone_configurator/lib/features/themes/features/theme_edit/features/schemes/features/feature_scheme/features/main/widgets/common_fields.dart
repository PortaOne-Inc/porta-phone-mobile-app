import 'package:flutter/material.dart';

import 'package:webtrit_phone/extensions/extensions.dart';

class CommonFields extends StatelessWidget {
  const CommonFields({
    required this.titleController,
    required this.iconController,
    required this.enabled,
    required this.initial,
    required this.onEnabledChanged,
    required this.onInitialChanged,
    super.key,
  });

  final TextEditingController titleController;
  final TextEditingController iconController;
  final bool enabled;
  final bool initial;
  final ValueChanged<bool> onEnabledChanged;
  final ValueChanged<bool> onInitialChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: 'Title Localization (titleL10n)',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.title),
          ),
          validator: (v) =>
              (v == null || v.isEmpty) ? 'Title is required' : null,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: iconController,
                decoration: const InputDecoration(
                  labelText: 'Icon code (hex), e.g. 0xe5fd',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.tag),
                ),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Icon is required' : null,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(iconController.text.toIconData()),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          title: const Text('Enable tab'),
          value: enabled,
          onChanged: onEnabledChanged,
        ),
        SwitchListTile(
          title: const Text('Make this the initial tab'),
          value: initial,
          onChanged: onInitialChanged,
        ),
      ],
    );
  }
}
