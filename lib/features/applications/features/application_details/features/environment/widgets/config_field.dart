import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';

/// A widget that represents environment configuration fields.
/// It can handle different types of configurations such as boolean, string, and options.
class ConfigField extends StatelessWidget {
  /// Creates a [ConfigField] widget.
  ///
  /// * [label] - The label for the configuration field.
  /// * [keyName] - The key name for the configuration.
  /// * [config] - The configuration map.
  /// * [onEnabledChanged] - Callback when the enabled state changes.
  /// * [options] - Optional list of options for the configuration.
  /// * [onConfigUpdate] - Optional callback when the configuration is updated.
  /// * [defaultValue] - Optional default value for the configuration.
  const ConfigField({
    required this.label,
    required this.keyName,
    required this.config,
    required this.onEnabledChanged,
    this.options,
    this.onConfigUpdate,
    super.key,
    this.defaultValue,
  });

  final String label;
  final String keyName;
  final List<String>? options;
  final Map<String, dynamic> config;
  final void Function<T>(String key, T value)? onConfigUpdate;
  final void Function(bool isEnabled, String key, dynamic value)
  onEnabledChanged;
  final dynamic defaultValue;

  @override
  Widget build(BuildContext context) {
    final enable = config.containsKey(keyName);
    final value = config[keyName] ?? defaultValue;
    final hasOptions = options?.isNotEmpty ?? false;

    return switch (value) {
      bool _ => BoolConfigField(
        label: label,
        value: value,
        enable: enable,
        onEnabledChanged: (it) => onEnabledChanged(it, keyName, value),
        onConfigUpdate: (val) => onConfigUpdate?.call(keyName, val),
      ),
      String? _ when hasOptions => OptionsConfigField(
        label: label,
        value: value ?? options!.first,
        enable: enable,
        options: options!,
        onEnabledChanged: (it) => onEnabledChanged(it, keyName, value),
        onConfigUpdate: (val) => onConfigUpdate?.call(keyName, val),
      ),
      _ => StringConfigField(
        label: label,
        enable: enable,
        value: value?.toString() ?? '',
        onEnabledChanged: (it) => onEnabledChanged(it, keyName, value),
        onConfigUpdate: (val) => onConfigUpdate?.call(keyName, val),
      ),
    };
  }
}

/// A stateful widget that represents a string configuration field.
class StringConfigField extends StatefulWidget {
  /// Creates a [StringConfigField] widget.
  ///
  /// * [label] - The label for the string configuration field.
  /// * [value] - The current value of the string configuration field.
  /// * [enable] - Whether the field is enabled.
  /// * [onEnabledChanged] - Callback when the enabled state changes.
  /// * [onConfigUpdate] - Optional callback when the configuration is updated.
  const StringConfigField({
    required this.label,
    required this.value,
    required this.enable,
    required this.onEnabledChanged,
    this.onConfigUpdate,
    super.key,
  });

  final String label;
  final String value;
  final bool enable;

  final ValueChanged<bool> onEnabledChanged;
  final void Function(String value)? onConfigUpdate;

  @override
  _StringConfigFieldState createState() => _StringConfigFieldState();
}

class _StringConfigFieldState extends State<StringConfigField> {
  late final TextEditingController _controller;
  bool _isEnabled = true;

  @override
  void initState() {
    super.initState();
    _isEnabled = widget.enable;
    _controller = TextEditingController(text: widget.value);
  }

  void _toggleEnabled(bool value) {
    setState(() => _isEnabled = value);
    widget.onEnabledChanged(value);
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
            onChanged: widget.onConfigUpdate,
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

/// A stateless widget that represents a boolean configuration field.
class BoolConfigField extends StatelessWidget {
  /// Creates a [BoolConfigField] widget.
  ///
  /// * [label] - The label for the boolean configuration field.
  /// * [value] - The current value of the boolean configuration field.
  /// * [enable] - Whether the field is enabled.
  /// * [onEnabledChanged] - Callback when the enabled state changes.
  /// * [onConfigUpdate] - Optional callback when the configuration is updated.
  const BoolConfigField({
    required this.label,
    required this.value,
    required this.onEnabledChanged,
    required this.enable,
    this.onConfigUpdate,
    super.key,
  });

  final String label;
  final bool value;
  final bool enable;
  final ValueChanged<bool>? onEnabledChanged;
  final ValueChanged<bool>? onConfigUpdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonExt<bool>(
              label: label,
              value: value,
              options: const [true, false],
              onChanged: enable
                  ? (value) => onConfigUpdate?.call(value ?? false)
                  : null,
              optionBuilder: (val) => val ? 'Enable' : 'Disable',
            ),
          ),
          Checkbox(
            value: enable,
            onChanged: (enabled) =>
                enabled != null ? onEnabledChanged?.call(enabled) : null,
          ),
        ],
      ),
    );
  }
}

/// A stateless widget that represents an options configuration field.
class OptionsConfigField extends StatelessWidget {
  /// Creates a [OptionsConfigField] widget.
  ///
  /// * [label] - The label for the options configuration field.
  /// * [value] - The current value of the options configuration field.
  /// * [enable] - Whether the field is enabled.
  /// * [options] - The list of options for the configuration.
  /// * [onEnabledChanged] - Callback when the enabled state changes.
  /// * [onConfigUpdate] - Optional callback when the configuration is updated.
  const OptionsConfigField({
    required this.label,
    required this.value,
    required this.enable,
    required this.options,
    required this.onEnabledChanged,
    this.onConfigUpdate,
    super.key,
  });

  final String label;
  final String value;
  final bool enable;

  final List<String> options;
  final ValueChanged<bool>? onEnabledChanged;
  final ValueChanged<String>? onConfigUpdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonExt<String>(
              padding: EdgeInsets.zero,
              label: label,
              value: value,
              options: options,
              onChanged: enable
                  ? (it) => it != null ? onConfigUpdate?.call(it) : null
                  : null,
              optionBuilder: (val) => val,
            ),
          ),
          Checkbox(
            value: enable,
            onChanged: (enabled) =>
                enabled != null ? onEnabledChanged?.call(enabled) : null,
          ),
        ],
      ),
    );
  }
}
