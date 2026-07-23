import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/core/widgets/toolbars/toolbars.dart';

enum ApplicationDetailProfile implements SubMenu {
  logOut;

  @override
  String translate(BuildContext context) => 'Log out';
}
