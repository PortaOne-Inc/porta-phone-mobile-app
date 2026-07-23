import 'package:flutter/material.dart';

class ConfiguratorGroupTitleTile extends StatelessWidget {
  const ConfiguratorGroupTitleTile({
    required this.titleData,
    this.padding,
    this.decoration,
    this.trailing,
    super.key,
  });

  final String titleData;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final color = themeData.colorScheme.primaryFixed.withValues(alpha: .05);

    return Container(
      color: decoration == null ? color : null,
      decoration: decoration?.copyWith(color: color),
      child: ListTile(
        dense: false,
        contentPadding: padding,
        title: Text(titleData, style: themeData.textTheme.bodyMedium),
        trailing: trailing,
      ),
    );
  }
}
