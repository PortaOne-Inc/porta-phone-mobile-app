import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class ConfigField extends StatefulWidget {
  const ConfigField({
    required this.label,
    required this.keyName,
    required this.config,
    required this.onEnabledChanged,
    this.onConfigUpdate,
    super.key,
    this.defaultValue,
  });

  final String label;
  final String keyName;
  final Map<String, dynamic> config;
  final void Function<T>(String key, T value)? onConfigUpdate;
  final void Function(bool isEnabled, String key, String value) onEnabledChanged;
  final String? defaultValue;

  @override
  _ConfigFieldState createState() => _ConfigFieldState();
}

class _ConfigFieldState extends State<ConfigField> {
  late TextEditingController _controller;
  late bool _isEnabled;

  @override
  void initState() {
    super.initState();
    _initializeValues();
  }

  @override
  void didUpdateWidget(covariant ConfigField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config[widget.keyName] != oldWidget.config[widget.keyName]) {
      _initializeValues();
    }
  }

  void _initializeValues() {
    final text = (widget.config[widget.keyName] as String?) ?? widget.defaultValue ?? '';
    final isEnabled = widget.config.containsKey(widget.keyName) as bool? ?? true;

    if (!mounted) return;

    setState(() {
      _controller = TextEditingController(text: text)..selection = TextSelection.collapsed(offset: text.length);
      _isEnabled = isEnabled;
    });
  }

  void _toggleEnabled(bool value) {
    setState(() => _isEnabled = value);
    widget.onEnabledChanged(value, widget.keyName, _controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlineInput(
            label: widget.label,
            controller: _controller,
            icon: Icons.text_fields,
            margin: const EdgeInsets.symmetric(vertical: 8),
            enabled: _isEnabled,
            onChanged: widget.onConfigUpdate != null
                ? (value) => widget.onConfigUpdate!<String>(widget.keyName.trim(), value.trim())
                : null,
          ),
        ),
        Checkbox(
          value: _isEnabled,
          onChanged: (value) {
            if (value != null) _toggleEnabled(value);
          },
        ),
      ],
    );
  }
}
