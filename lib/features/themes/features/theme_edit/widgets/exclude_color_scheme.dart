import 'package:flutter/material.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_configurator/core/core.dart';

class ExcludeColorScheme extends StatefulWidget {
  const ExcludeColorScheme({
    super.key,
    required this.selectedSchemeKeys,
    required this.onUpdate,
  });

  final List<ColorSchemeKeys> selectedSchemeKeys;

  final Function onUpdate;

  @override
  State<ExcludeColorScheme> createState() => _ExcludeColorSchemeState();
}

class _ExcludeColorSchemeState extends State<ExcludeColorScheme> {
  final _schemeKeys = [...ColorSchemeKeys.values];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exclude color from scheme: ',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ...widget.selectedSchemeKeys.map<Widget>(
              (chip) => Chip(
                key: ValueKey(chip),
                label: Text(chip.name.capitalize),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                onDeleted: () => _onDeleteExclude(chip),
              ),
            ),
            PopupMenuButton(
              child: const Chip(
                key: ValueKey('Add'),
                label: Icon(Icons.add),
              ),
              onSelected: (value) => _addExclude(value),
              itemBuilder: (BuildContext bc) => _schemeKeys
                  .map((key) => PopupMenuItem(
                        value: key,
                        child: Text(key.name.capitalize),
                      ))
                  .toList(),
            )
          ],
        )
      ],
    );
  }

  void _addExclude(ColorSchemeKeys value) {
    _schemeKeys.remove(value);
    widget.selectedSchemeKeys.add(value);
    widget.onUpdate();
    setState(() {});
  }

  void _onDeleteExclude(ColorSchemeKeys chip) {
    widget.selectedSchemeKeys.remove(chip);
    _schemeKeys.add(chip);
    widget.onUpdate();
    setState(() {});
  }
}
