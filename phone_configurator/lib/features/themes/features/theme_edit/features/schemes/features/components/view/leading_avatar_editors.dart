import 'package:flutter/material.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/extensions/extensions.dart';
import 'package:webtrit_configurator/widgets/widgets.dart';

/// Editors for the avatar indicator/badge styles (presence, registration,
/// smart indicator). Shared between the Images & Icons tab and the
/// Indicators & Statuses tab so the same controls render in both places.

class PresenceBadgeSettings extends StatelessWidget {
  const PresenceBadgeSettings({required this.value, required this.onChanged, super.key});

  final PresenceBadgeStyleConfig value;
  final ValueChanged<PresenceBadgeStyleConfig> onChanged;

  Future<void> _pickColor(BuildContext context, String? currentHex, ValueChanged<String> onApply) async {
    final newColor = await context.showColorPicker(currentColor: currentHex?.tryParseColor());
    if (newColor != null) {
      onApply(newColor.toHex());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Presence Badge', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ColorField(
                title: 'Available',
                color: value.availableColor?.tryParseColor(),
                onTap: (_) =>
                    _pickColor(context, value.availableColor, (hex) => onChanged(value.copyWith(availableColor: hex))),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ColorField(
                title: 'Unavailable',
                color: value.unavailableColor?.tryParseColor(),
                onTap: (_) => _pickColor(
                  context,
                  value.unavailableColor,
                  (hex) => onChanged(value.copyWith(unavailableColor: hex)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        NumberInputControl(
          label: 'Size Factor',
          value: value.sizeFactor,
          onChanged: (v) => onChanged(value.copyWith(sizeFactor: v)),
        ),
      ],
    );
  }
}

class RegisteredBadgeSettings extends StatelessWidget {
  const RegisteredBadgeSettings({required this.value, required this.onChanged, super.key});

  final RegisteredBadgeStyleConfig value;
  final ValueChanged<RegisteredBadgeStyleConfig> onChanged;

  Future<void> _pickColor(BuildContext context, String? currentHex, ValueChanged<String> onApply) async {
    final newColor = await context.showColorPicker(currentColor: currentHex?.tryParseColor());
    if (newColor != null) {
      onApply(newColor.toHex());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Registration Badge', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ColorField(
                title: 'Registered',
                color: value.registeredColor?.tryParseColor(),
                onTap: (_) => _pickColor(
                  context,
                  value.registeredColor,
                  (hex) => onChanged(value.copyWith(registeredColor: hex)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ColorField(
                title: 'Unregistered',
                color: value.unregisteredColor?.tryParseColor(),
                onTap: (_) => _pickColor(
                  context,
                  value.unregisteredColor,
                  (hex) => onChanged(value.copyWith(unregisteredColor: hex)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        NumberInputControl(
          label: 'Size Factor',
          value: value.sizeFactor,
          onChanged: (v) => onChanged(value.copyWith(sizeFactor: v)),
        ),
      ],
    );
  }
}

class SmartIndicatorSettings extends StatelessWidget {
  const SmartIndicatorSettings({required this.value, required this.onChanged, super.key});

  final SmartIndicatorStyleConfig value;
  final ValueChanged<SmartIndicatorStyleConfig> onChanged;

  static const int _defaultCodePoint = 0xe491;

  Future<void> _pickBackgroundColor(BuildContext context) async {
    final newColor = await context.showColorPicker(currentColor: value.backgroundColor?.tryParseColor());
    if (newColor != null) {
      onChanged(value.copyWith(backgroundColor: newColor.toHex()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Smart Indicator', style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ColorField(
                title: 'Background',
                color: value.backgroundColor?.tryParseColor(),
                onTap: (_) => _pickBackgroundColor(context),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: NumberInputControl(
                label: 'Size Factor',
                value: value.sizeFactor,
                onChanged: (v) => onChanged(value.copyWith(sizeFactor: v)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: CodePointInput(
                value: value.icon?.codePoint ?? _defaultCodePoint,
                onChanged: (v) => onChanged(
                  value.copyWith(
                    icon: (value.icon ?? const IconDataConfig(codePoint: _defaultCodePoint)).copyWith(codePoint: v),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                initialValue: value.icon?.fontFamily ?? 'MaterialIcons',
                decoration: const InputDecoration(
                  labelText: 'Font Family',
                  isDense: true,
                  border: OutlineInputBorder(),
                ),
                onChanged: (v) => onChanged(
                  value.copyWith(
                    icon: (value.icon ?? const IconDataConfig(codePoint: _defaultCodePoint)).copyWith(fontFamily: v),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CodePointInput extends StatefulWidget {
  const CodePointInput({required this.value, required this.onChanged, super.key});

  final int value;
  final ValueChanged<int> onChanged;

  @override
  State<CodePointInput> createState() => _CodePointInputState();
}

class _CodePointInputState extends State<CodePointInput> {
  late final TextEditingController _controller;

  String _format(int v) => '0x${v.toRadixString(16)}';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: _format(widget.value));
  }

  @override
  void didUpdateWidget(covariant CodePointInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (_parse(_controller.text) != widget.value) {
        final newText = _format(widget.value);
        _controller.value = TextEditingValue(
          text: newText,
          selection: TextSelection.collapsed(offset: newText.length),
        );
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int? _parse(String input) {
    final v = input.trim();
    if (v.isEmpty) return null;
    if (v.startsWith('0x') || v.startsWith('0X')) {
      return int.tryParse(v.substring(2), radix: 16);
    }
    if (RegExp(r'^[0-9a-fA-F]+$').hasMatch(v)) {
      return int.tryParse(v, radix: 16);
    }
    return int.tryParse(v);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: const InputDecoration(
        labelText: 'Code Point (Hex)',
        isDense: true,
        border: OutlineInputBorder(),
        hintText: '0xe491',
      ),
      onChanged: (v) {
        final parsed = _parse(v);
        if (parsed != null) widget.onChanged(parsed);
      },
    );
  }
}
