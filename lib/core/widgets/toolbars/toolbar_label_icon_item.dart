import 'package:flutter/material.dart';

class ToolbarLabelWidgetItem extends StatelessWidget {
  const ToolbarLabelWidgetItem({
    super.key,
    required this.icon,
    this.onTap,
    this.color,
    this.margin,
  });

  final Function()? onTap;
  final Color? color;
  final IconData icon;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: kToolbarHeight - 8,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: color,
        ),
      ),
    );
  }
}
