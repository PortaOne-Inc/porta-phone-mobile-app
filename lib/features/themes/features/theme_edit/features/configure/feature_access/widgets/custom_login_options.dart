import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CustomLoginOptions extends StatelessWidget {
  const CustomLoginOptions({
    required this.customLoginOption,
    required this.url,
    required this.onCustomLoginOptionChanged,
    required this.onCustomUrlChanged,
    required this.onHtmlAssetChanged,
    required this.assets,
    super.key,
  });

  final CustomLoginOption customLoginOption;
  final String url;
  final ValueChanged<CustomLoginOption> onCustomLoginOptionChanged;
  final ValueChanged<String> onCustomUrlChanged;
  final ValueChanged<ThemeAssetModel> onHtmlAssetChanged;
  final List<ThemeAssetModel> assets;

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
                value: CustomLoginOption.values.contains(customLoginOption)
                    ? customLoginOption
                    : CustomLoginOption.values.first,
                items: CustomLoginOption.values.map((option) {
                  return DropdownMenuItem(
                    value: option,
                    child: Text(
                      option == CustomLoginOption.url ? 'Provide URL' : 'Provide HTML File',
                    ),
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
                  initialValue: url,
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
              Expanded(
                child: Text('Select HTML Asset:', style: textTheme.labelLarge),
              ),
              Expanded(
                flex: 2,
                child: assets.isNotEmpty
                    ? DropdownButton<ThemeAssetModel>(
                        value: assets.where((asset) => url.contains(asset.id)).firstOrNull,
                        items: assets.map((asset) {
                          return DropdownMenuItem<ThemeAssetModel>(
                            value: asset, // Use the full `ThemeAssetModel` object as the value
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  asset.name,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyMedium, // Primary text style
                                ),
                                Text(
                                  '${asset.id}.html',
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodySmall
                                      ?.copyWith(color: colorScheme.onSurfaceVariant), // Subtitle style
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            onHtmlAssetChanged(value);
                          }
                        },
                      )
                    : Text(
                        'No assets available',
                        style: textTheme.labelLarge,
                      ),
              ),
            ],
          ),
      ],
    );
  }
}
