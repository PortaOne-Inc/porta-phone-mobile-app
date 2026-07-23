import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OutlineInput extends StatelessWidget {
  const OutlineInput({
    required this.label,
    this.icon,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.onChanged,
    this.constraints,
    this.enabled = true,
    this.borderColor,
    this.keyboardType,
    this.inputFormatters,
    this.initial = '',
    super.key,
  });

  /// Named factory: decimal numbers (allows one dot)
  factory OutlineInput.number({
    required String label,
    IconData? icon,
    TextEditingController? controller,
    EdgeInsets padding = EdgeInsets.zero,
    EdgeInsets margin = EdgeInsets.zero,
    ValueChanged<String>? onChanged,
    BoxConstraints? constraints,
    bool enabled = true,
    Color? borderColor,
    Key? key,
  }) {
    return OutlineInput(
      key: key,
      label: label,
      icon: icon,
      controller: controller,
      padding: padding,
      margin: margin,
      onChanged: onChanged,
      constraints: constraints,
      enabled: enabled,
      borderColor: borderColor,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
      ],
    );
  }

  /// Named factory: integers only
  factory OutlineInput.intOnly({
    required String label,
    IconData? icon,
    TextEditingController? controller,
    EdgeInsets padding = EdgeInsets.zero,
    EdgeInsets margin = EdgeInsets.zero,
    ValueChanged<String>? onChanged,
    BoxConstraints? constraints,
    bool enabled = true,
    Color? borderColor,
    Key? key,
  }) {
    return OutlineInput(
      key: key,
      label: label,
      icon: icon,
      controller: controller,
      padding: padding,
      margin: margin,
      onChanged: onChanged,
      constraints: constraints,
      enabled: enabled,
      borderColor: borderColor,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }

  /// Named factory: hex code point (optional 0x prefix)
  factory OutlineInput.hex({
    required String label,
    IconData? icon,
    TextEditingController? controller,
    EdgeInsets padding = EdgeInsets.zero,
    EdgeInsets margin = EdgeInsets.zero,
    ValueChanged<String>? onChanged,
    BoxConstraints? constraints,
    bool enabled = true,
    Color? borderColor,
    Key? key,
  }) {
    return OutlineInput(
      key: key,
      label: label,
      icon: icon,
      controller: controller,
      padding: padding,
      margin: margin,
      onChanged: onChanged,
      constraints: constraints,
      enabled: enabled,
      borderColor: borderColor,
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^(0[xX])?[0-9a-fA-F]*$')),
      ],
    );
  }

  final String label;
  final IconData? icon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BoxConstraints? constraints;
  final bool enabled;
  final Color? borderColor;
  final String initial;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor =
        borderColor ?? Theme.of(context).colorScheme.primary;

    return Container(
      padding: padding,
      margin: margin,
      child: ConstrainedBox(
        constraints: constraints ?? const BoxConstraints(),
        child: TextField(
          enabled: enabled,
          controller: controller ?? TextEditingController(text: initial),
          onChanged: onChanged,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor, width: 2),
            ),
            prefixIcon: icon != null ? Icon(icon) : null,
          ),
        ),
      ),
    );
  }
}
