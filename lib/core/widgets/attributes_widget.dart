import 'package:flutter/material.dart';

import 'group_title_list_tile.dart';

class AttributesWidget extends StatelessWidget {
  const AttributesWidget({
    required this.attributes,
    required this.onAddAttribute,
    required this.onUpdateAttribute,
    required this.onRemoveAttribute,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    super.key,
  });

  final List<MapEntry<String, String>> attributes;
  final void Function(int index, String key, String value) onUpdateAttribute;
  final void Function(int index) onRemoveAttribute;
  final VoidCallback onAddAttribute;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupTitleListTile(
          titleData: 'Attributes',
          contentPadding: contentPadding,
          style: textTheme.titleMedium,
          backgroundColor: colorScheme.surfaceContainerHigh,
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAddAttribute,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          padding: contentPadding,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: attributes.length,
          itemBuilder: (context, index) {
            final entry = attributes[index];
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Key', border: OutlineInputBorder()),
                    controller: TextEditingController(text: entry.key),
                    onChanged: (value) => onUpdateAttribute(index, value, entry.value),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Value', border: OutlineInputBorder()),
                    controller: TextEditingController(text: entry.value),
                    onChanged: (value) => onUpdateAttribute(index, entry.key, value),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => onRemoveAttribute(index),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
