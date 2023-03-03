import 'package:flutter/material.dart';
import 'package:webtrit_configurator/core/config/l10n/l10n.dart';

class FontItem extends StatelessWidget {
  const FontItem({
    super.key,
    required this.onTap,
    this.fontName = '',
  });

  final Function() onTap;
  final String? fontName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 16, right: 16),
      elevation: 1,
      child: InkWell(
        onTap: () async => onTap.call(),
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Theme.of(context).colorScheme.primary, width: 6),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (fontName ?? '').isEmpty
                      ? context.l10n.feature_theme_edit_add_font
                      : context.l10n.feature_theme_edit_add_font,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  fontName ?? '',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
