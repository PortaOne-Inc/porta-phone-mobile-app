import 'package:flutter/material.dart';

class GroupTitleTile extends StatelessWidget {
  const GroupTitleTile({
    required this.titleData,
    required this.style,
    required this.backgroundColor,
    this.contentPadding = EdgeInsets.zero,
    this.trailing,
    super.key,
  });

  final String titleData;
  final TextStyle? style;
  final Color backgroundColor;
  final Widget? trailing;
  final EdgeInsets contentPadding;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return ColoredBox(
      color: backgroundColor,
      child: ListTile(
        contentPadding: contentPadding,
        title: Text(titleData, style: style),
        trailing: trailing,
        tileColor: themeData.colorScheme.surface,
      ),
    );
  }
}
