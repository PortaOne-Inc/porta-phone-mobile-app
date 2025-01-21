import 'package:flutter/material.dart';

import '../models/models.dart';

class CustomLoginOptions extends StatelessWidget {
  const CustomLoginOptions({
    required this.customLoginOption,
    required this.customUrl,
    required this.htmlFilePath,
    required this.onCustomLoginOptionChanged,
    required this.onCustomUrlChanged,
    required this.onSelectHtmlFile,
    super.key,
  });

  final CustomLoginOption customLoginOption;
  final String customUrl;
  final String htmlFilePath;
  final ValueChanged<CustomLoginOption> onCustomLoginOptionChanged;
  final ValueChanged<String> onCustomUrlChanged;
  final VoidCallback onSelectHtmlFile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 2,
          color: colorScheme.surfaceContainerLow,
        ),
        Row(
          children: [
            Expanded(
              child: Text('HTML source:', style: textTheme.labelLarge),
            ),
            Expanded(
              flex: 2,
              child: DropdownButton<CustomLoginOption>(
                value: customLoginOption,
                items: CustomLoginOption.values.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(option == CustomLoginOption.url ? 'Provide URL' : 'Provide HTML File'),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    onCustomLoginOptionChanged(value);
                  }
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (customLoginOption == CustomLoginOption.url)
          Row(
            children: [
              Expanded(
                child: Text(
                  'Custom Login URL:',
                  style: textTheme.labelLarge,
                ),
              ),
              Expanded(
                flex: 2,
                child: TextFormField(
                  initialValue: customUrl,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: onCustomUrlChanged,
                ),
              ),
            ],
          ),
        if (customLoginOption == CustomLoginOption.html)
          Row(
            children: [
              const Expanded(
                child: Text('HTML File Path:', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              OutlinedButton(
                onPressed: onSelectHtmlFile,
                child: Text(
                  htmlFilePath.isNotEmpty ? htmlFilePath : 'Select HTML File',
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelMedium,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
