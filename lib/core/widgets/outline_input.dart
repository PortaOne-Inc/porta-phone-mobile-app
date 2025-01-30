import 'package:flutter/material.dart';

class OutlineInput extends StatelessWidget {
  const OutlineInput({
    required this.label,
    required this.icon,
    this.controller,
    this.padding = EdgeInsets.zero,
    this.margin = EdgeInsets.zero,
    this.onChanged,
    this.constraints,
    super.key,
  });

  final String label;
  final IconData icon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BoxConstraints? constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      child: ConstrainedBox(
        constraints: constraints ?? const BoxConstraints(minWidth: 0),
        child: TextField(

          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
            prefixIcon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
