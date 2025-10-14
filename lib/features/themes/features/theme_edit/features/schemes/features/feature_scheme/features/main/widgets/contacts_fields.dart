import 'package:flutter/material.dart';

class ContactsFields extends StatelessWidget {
  const ContactsFields({
    required this.local,
    required this.external,
    required this.onLocalChanged,
    required this.onExternalChanged,
    super.key,
  });

  final bool local;
  final bool external;
  final ValueChanged<bool> onLocalChanged;
  final ValueChanged<bool> onExternalChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: const Text('Enable local contacts'),
          value: local,
          onChanged: onLocalChanged,
        ),
        SwitchListTile(
          title: const Text('Enable PBX contacts'),
          value: external,
          onChanged: onExternalChanged,
        ),
      ],
    );
  }
}
