import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class UpdaterChooserButton extends StatefulWidget {
  const UpdaterChooserButton({
    required this.initial,
    required this.items,
    required this.progress,
    required this.onPressed,
    super.key,
  });

  final String initial;
  final List<String> items;
  final bool progress;

  final ObjectCallback<String> onPressed;

  @override
  State<UpdaterChooserButton> createState() => _UpdaterChooserButtonState();
}

class _UpdaterChooserButtonState extends State<UpdaterChooserButton> {
  late String _currentSelect;

  @override
  void initState() {
    _currentSelect = widget.initial;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Wrap(
      children: [
        SizedBox(
          height: 32,
          child: DropdownButton<String>(
            focusColor: colorScheme.surface,
            icon: const Icon(Icons.arrow_drop_down_outlined),
            value: _currentSelect,
            elevation: 1,
            underline: Container(height: 0),
            onChanged: (String? value) {
              _currentSelect = value!;
              setState(() {});
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value.capitalize,
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.secondary,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 8),
        OutlinedButton(
          onPressed: widget.progress
              ? null
              : () => widget.onPressed(_currentSelect),
          child: widget.progress
              ? const SizedBox.square(
                  dimension: 16,
                  child: CircularProgressIndicator(strokeWidth: 1),
                )
              : const Icon(Icons.add),
        ),
      ],
    );
  }
}
