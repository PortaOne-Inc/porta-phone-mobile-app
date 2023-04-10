import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';

class SwitcherLanguage extends StatefulWidget {
  const SwitcherLanguage({super.key, required this.onSwitchedLanguage, this.margin = EdgeInsets.zero});

  final Function onSwitchedLanguage;
  final EdgeInsets margin;

  @override
  State<SwitcherLanguage> createState() => _SwitcherLanguageState();
}

class _SwitcherLanguageState extends State<SwitcherLanguage> {
  bool _isSelectedUa = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: _isSelectedUa
              ? Text(context.l10n.common_language_ua, style: Theme.of(context).textTheme.titleSmall)
              : Text(context.l10n.common_language_en, style: Theme.of(context).textTheme.titleSmall),
          onTap: () {
            _isSelectedUa = !_isSelectedUa;
            widget.onSwitchedLanguage();
            setState(() {});
          },
        ),
      ),
    );
  }
}
