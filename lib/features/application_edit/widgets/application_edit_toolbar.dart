import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/l10n/l10n.dart';
import 'package:webtrit_configurator/share/widgets/widgets.dart';

class ApplicationEditToolbar extends StatelessWidget {
  const ApplicationEditToolbar({
    super.key,
    required this.onSwitchedLanguage,
  });

  final Function() onSwitchedLanguage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 6),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 8, right: 8),
              child: Row(
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    children: _buildLeftMenu(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                context.l10n.feature_application_Toolbar_edit,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Wrap(
                  alignment: WrapAlignment.end,
                  children: _buildRightMenu(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLeftMenu() => [];

  List<Widget> _buildRightMenu(BuildContext context) {
    return [];
  }
}
