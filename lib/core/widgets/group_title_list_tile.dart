import 'package:flutter/material.dart';

class GroupTitleListTile extends StatelessWidget {
  const GroupTitleListTile({
    super.key,
    required this.titleData,
    required this.style,
    required this.backgroundColor,
    this.trailing,
  });

  final String titleData;
  final TextStyle? style;
  final Color backgroundColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return ColoredBox(
      color: backgroundColor,
      child: ListTile(
        title: Text(
          titleData,
          style: style,
        ),
        trailing: trailing,
        tileColor: themeData.colorScheme.surface,
      ),
    );
  }
}
