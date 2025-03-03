import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

class ConfigField extends StatelessWidget {
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
  final void Function(bool isEnabled, String key, dynamic value) onEnabledChanged;
  final dynamic defaultValue;

  @override
  Widget build(BuildContext context) {
    final value = config[keyName] ?? defaultValue;

    if (value is bool) {
      return BoolConfigField(
        label: label,
        keyName: keyName,
        config: config,
        onEnabledChanged: onEnabledChanged,
        onConfigUpdate: onConfigUpdate,
      );
    } else {
      return StringConfigField(
        label: label,
        keyName: keyName,
        config: config,
        onEnabledChanged: onEnabledChanged,
        onConfigUpdate: onConfigUpdate,
        defaultValue: defaultValue == null ? '' : defaultValue.toString(),
      );
    }
  }
}

class StringConfigField extends StatefulWidget {
  const StringConfigField({
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
  _StringConfigFieldState createState() => _StringConfigFieldState();
}

class _StringConfigFieldState extends State<StringConfigField> {
  late final TextEditingController _controller;
  bool _isEnabled = true;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _initializeValues();
  }

  void _initializeValues() {
    final text = widget.config[widget.keyName] as String? ?? widget.defaultValue ?? '';
    final isEnabled = widget.config.containsKey(widget.keyName);

    _controller.text = text;
    setState(() => _isEnabled = isEnabled);
  }

  void _toggleEnabled(bool value) {
    setState(() => _isEnabled = value);
    widget.onEnabledChanged(value, widget.keyName, _controller.text);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                ? (value) => widget.onConfigUpdate!(widget.keyName.trim(), value.trim())
                : null,
          ),
        ),
        Checkbox(
          value: _isEnabled,
          onChanged: (value) => _toggleEnabled(value ?? false),
        ),
      ],
    );
  }
}

class BoolConfigField extends StatefulWidget {
  const BoolConfigField({
    required this.label,
    required this.keyName,
    required this.config,
    required this.onEnabledChanged,
    this.onConfigUpdate,
    super.key,
    this.defaultValue = false,
  });

  final String label;
  final String keyName;
  final Map<String, dynamic> config;
  final void Function<T>(String key, T value)? onConfigUpdate;
  final void Function(bool isEnabled, String key, bool value) onEnabledChanged;
  final bool defaultValue;

  @override
  _BoolConfigFieldState createState() => _BoolConfigFieldState();
}

class _BoolConfigFieldState extends State<BoolConfigField> {
  late bool _value;
  bool _isEnabled = true;

  @override
  void initState() {
    super.initState();
    _initializeValues();
  }

  @override
  void didUpdateWidget(covariant BoolConfigField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.config[widget.keyName] != oldWidget.config[widget.keyName]) {
      _initializeValues();
    }
  }

  void _initializeValues() {
    _value = widget.config[widget.keyName] as bool? ?? widget.defaultValue;
    _isEnabled = widget.config.containsKey(widget.keyName);
  }

  void _toggleEnabled(bool value) {
    setState(() => _isEnabled = value);
    widget.onEnabledChanged(value, widget.keyName, _value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonExt<bool>(
              label: widget.label,
              value: _value,
              options: const [true, false],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _value = value);
                  widget.onConfigUpdate?.call(widget.keyName, value);
                }
              },
              optionBuilder: (value) => value ? 'Enable' : 'Disable',
            ),
          ),
          Checkbox(
            value: _isEnabled,
            onChanged: (value) => _toggleEnabled(value ?? false),
          ),
        ],
      ),
    );
  }
}
