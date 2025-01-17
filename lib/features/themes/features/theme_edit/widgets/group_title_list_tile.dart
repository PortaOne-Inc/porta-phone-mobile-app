import 'package:flutter/material.dart';

class GroupTitleListTile extends StatelessWidget {
  const GroupTitleListTile({
    required this.titleData,
    this.padding,
    super.key,
    this.decoration,
  });

  final String titleData;
  final EdgeInsets? padding;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final color = themeData.colorScheme.primaryFixed.withValues(alpha: .05);

    return Container(
      color: decoration == null ? color : null,
      decoration: decoration?.copyWith(color: color),
      child: ListTile(
        contentPadding: padding,
        title: Text(
          titleData,
          style: themeData.textTheme.bodyMedium,
        ),
        tileColor: themeData.colorScheme.surface,
      ),
    );
  }
}
