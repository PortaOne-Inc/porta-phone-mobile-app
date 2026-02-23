import 'package:flutter/material.dart';

import 'group_title_list_tile.dart';

class AttributesWidget extends StatefulWidget {
  const AttributesWidget({
    required this.attributes,
    required this.onAddAttribute,
    required this.onUpdateAttribute,
    required this.onRemoveAttribute,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    super.key,
  });

  final Map<String, String> attributes;
  final void Function(String key, String value) onUpdateAttribute;
  final void Function(String key) onRemoveAttribute;
  final VoidCallback onAddAttribute;
  final EdgeInsets contentPadding;

  @override
  _AttributesWidgetState createState() => _AttributesWidgetState();
}

class _AttributesWidgetState extends State<AttributesWidget> {
  late List<TextEditingController> _keyControllers;
  late List<TextEditingController> _valueControllers;
  late List<String> _keys;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _keys = widget.attributes.keys.toList();
    _keyControllers = _keys
        .map((key) => TextEditingController(text: key))
        .toList();
    _valueControllers = _keys
        .map((key) => TextEditingController(text: widget.attributes[key]))
        .toList();
  }

  @override
  void didUpdateWidget(covariant AttributesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.attributes != widget.attributes) {
      _keys = widget.attributes.keys.toList();

      for (var i = 0; i < _keys.length; i++) {
        if (i < _keyControllers.length) {
          final keyText = _keyControllers[i].text;
          final valueText = _valueControllers[i].text;

          if (keyText != _keys[i]) {
            _keyControllers[i].text = _keys[i];
          }
          if (valueText != widget.attributes[_keys[i]]) {
            _valueControllers[i].text = widget.attributes[_keys[i]]!;
          }
        } else {
          _keyControllers.add(TextEditingController(text: _keys[i]));
          _valueControllers.add(
            TextEditingController(text: widget.attributes[_keys[i]]),
          );
        }
      }

      if (_keyControllers.length > _keys.length) {
        _keyControllers.sublist(_keys.length).forEach((c) => c.dispose());
        _keyControllers = _keyControllers.sublist(0, _keys.length);
      }

      if (_valueControllers.length > _keys.length) {
        _valueControllers.sublist(_keys.length).forEach((c) => c.dispose());
        _valueControllers = _valueControllers.sublist(0, _keys.length);
      }
    }
  }

  @override
  void dispose() {
    for (final controller in _keyControllers) {
      controller.dispose();
    }
    for (final controller in _valueControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupTitleTile(
          titleData: 'Attributes',
          contentPadding: widget.contentPadding,
          style: textTheme.titleMedium,
          backgroundColor: colorScheme.surfaceContainerHigh,
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: widget.onAddAttribute,
          ),
        ),
        const SizedBox(height: 8),
        ListView.separated(
          padding: widget.contentPadding,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _keys.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    key: ValueKey(index.toString()),
                    decoration: const InputDecoration(
                      labelText: 'Key',
                      border: OutlineInputBorder(),
                    ),
                    controller: _keyControllers[index],
                    onChanged: (value) => widget.onUpdateAttribute(
                      value,
                      _valueControllers[index].text,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    key: ValueKey(index.toString()),
                    decoration: const InputDecoration(
                      labelText: 'Value',
                      border: OutlineInputBorder(),
                    ),
                    controller: _valueControllers[index],
                    onChanged: (value) => widget.onUpdateAttribute(
                      _keyControllers[index].text,
                      value,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => widget.onRemoveAttribute(_keys[index]),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
