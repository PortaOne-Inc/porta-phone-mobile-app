import 'package:flutter/material.dart';

class EmbeddedPickerTile extends StatelessWidget {
  const EmbeddedPickerTile({
    required this.selectedTitle,
    required this.onTap,
    super.key,
  });

  final String selectedTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(selectedTitle),
      subtitle: const Text('Displayed inside embedded page'),
      leading: const Icon(Icons.web_asset),
      trailing: const Icon(Icons.navigate_next),
      onTap: onTap,
    );
  }
}
