import 'package:flutter/material.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';

import 'login_scheme_common.dart';
import 'login_scheme_welcome.dart';

class LoginSchemeScreen extends StatelessWidget {
  const LoginSchemeScreen({
    required this.callback,
    required this.sourceAppConfigLogin,
    super.key,
  });

  final AppConfigLogin sourceAppConfigLogin;
  final ObjectCallback<AppConfigLogin> callback;

  bool get _isEmbedded =>
      sourceAppConfigLogin
          .common
          .fullScreenLaunchEmbeddedResourceId
          ?.isNotEmpty ??
      false;

  @override
  Widget build(BuildContext context) {
    final showNativeTab = !_isEmbedded;

    final tabs = <Tab>[
      const Tab(text: 'Base login config'),
      if (showNativeTab) const Tab(text: 'Native welcome screen'),
    ];

    final views = <Widget>[
      LoginSchemeCommon(
        config: sourceAppConfigLogin.common,
        callback: (it) {
          callback(sourceAppConfigLogin.copyWith(common: it));
        },
      ),
      if (showNativeTab)
        LoginSchemeWelcome(
          config: sourceAppConfigLogin.modeSelect,
          callback: (it) =>
              callback(sourceAppConfigLogin.copyWith(modeSelect: it)),
        ),
    ];

    return DefaultTabController(
      key: ValueKey(tabs.length),
      length: tabs.length,
      child: Column(
        children: [
          TabBar(isScrollable: true, tabs: tabs),
          const SizedBox(height: 12),
          Expanded(child: TabBarView(children: views)),
        ],
      ),
    );
  }
}
