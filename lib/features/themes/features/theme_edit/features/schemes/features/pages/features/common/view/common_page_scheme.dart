import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/features.dart';

class CommonPageScheme extends StatelessWidget {
  const CommonPageScheme({
    required this.loginPageConfig,
    required this.callback,
    required this.loginModeSelectScreenStyles,
    super.key,
  });

  final LoginPageConfig loginPageConfig;
  final ObjectCallback<LoginPageConfig> callback;
  final LoginModeSelectScreenStyles? loginModeSelectScreenStyles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BorderContainer(
            title: 'Common pages image',
            padding: const EdgeInsets.all(16),
            child: Wrap(spacing: 16, runSpacing: 16, children: [
              UrlImageField(
                title: 'Primary image',
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/webtrit-configurator-stage.appspot.com/o/assets%2Fmicrosoft-teams.svg?alt=media&token=254dc137-002d-4a95-b224-1161ad83e340",
                constraints: BoxConstraints.loose(Size(200, 200)),
                onTap: () {
                  // GoRouter.of(context).pushNamed(SchemeRoute.assetsConfiguration.name);
                },
              ),
              UrlImageField(
                title: 'Secondary image',
                constraints: BoxConstraints.loose(Size(200, 200)),
                onTap: () {
                  // GoRouter.of(context).pushNamed(SchemeRoute.assetsConfiguration.name);
                },
              )
            ]),
          ),
        ],
      ),
    );
  }
}
