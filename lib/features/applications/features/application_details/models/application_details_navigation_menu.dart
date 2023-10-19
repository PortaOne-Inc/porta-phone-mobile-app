import 'package:flutter/widgets.dart';

import 'package:webtrit_configurator/core/widgets/toolbars/toolbars.dart';

enum ApplicationDetailNavigate implements SubMenu {
  application;

  @override
  String translate(BuildContext context) => 'Go to application';
}
