import 'package:flutter/material.dart';

import 'group_title_list_tile.dart';

class AttributesWidget extends StatefulWidget {
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
  _AttributesWidgetState createState() => _AttributesWidgetState();
}

class _AttributesWidgetState extends State<AttributesWidget> {
  late List<TextEditingController> _keyControllers;
  late List<TextEditingController> _valueControllers;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    _keyControllers = widget.attributes.map((e) => TextEditingController(text: e.key)).toList();
    _valueControllers = widget.attributes.map((e) => TextEditingController(text: e.value)).toList();
  }

  @override
  void didUpdateWidget(covariant AttributesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.attributes != widget.attributes) {
      for (var i = 0; i < widget.attributes.length; i++) {
        if (i < _keyControllers.length) {
          final keyText = _keyControllers[i].text;
          final valueText = _valueControllers[i].text;

          if (keyText != widget.attributes[i].key) {
            _keyControllers[i].text = widget.attributes[i].key;
          }
          if (valueText != widget.attributes[i].value) {
            _valueControllers[i].text = widget.attributes[i].value;
          }
        } else {
          _keyControllers.add(TextEditingController(text: widget.attributes[i].key));
          _valueControllers.add(TextEditingController(text: widget.attributes[i].value));
        }
      }

      if (_keyControllers.length > widget.attributes.length) {
        _keyControllers.sublist(widget.attributes.length).forEach((c) => c.dispose());
        _keyControllers = _keyControllers.sublist(0, widget.attributes.length);
      }

      if (_valueControllers.length > widget.attributes.length) {
        _valueControllers.sublist(widget.attributes.length).forEach((c) => c.dispose());
        _valueControllers = _valueControllers.sublist(0, widget.attributes.length);
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
          itemCount: widget.attributes.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    key: ValueKey(index.toString()),
                    decoration: const InputDecoration(labelText: 'Key', border: OutlineInputBorder()),
                    controller: _keyControllers[index],
                    onChanged: (value) => widget.onUpdateAttribute(index, value, _valueControllers[index].text),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    key: ValueKey(index.toString()),
                    decoration: const InputDecoration(labelText: 'Value', border: OutlineInputBorder()),
                    controller: _valueControllers[index],
                    onChanged: (value) => widget.onUpdateAttribute(index, _keyControllers[index].text, value),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => widget.onRemoveAttribute(index),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
