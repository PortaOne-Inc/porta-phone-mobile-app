import 'package:flutter/material.dart';

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
    super.key,
  });

  final String label;
  final IconData? icon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BoxConstraints? constraints;
  final bool enabled;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = borderColor ?? Theme.of(context).colorScheme.primary;

    return Container(
      padding: padding,
      margin: margin,
      child: ConstrainedBox(
        constraints: constraints ?? const BoxConstraints(minWidth: 0),
        child: TextField(
          enabled: enabled,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: effectiveBorderColor, width: 2.0),
            ),
            prefixIcon: icon != null ? Icon(icon) : null,
          ),
        ),
      ),
    );
  }
}
