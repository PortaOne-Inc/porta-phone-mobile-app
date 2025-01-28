import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/features.dart';

class LoginPageView extends StatelessWidget {
  const LoginPageView({
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BorderContainer(
            title: 'Images',
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              UrlImageField(
                title: 'Welcome image',
                resource: loginPageConfig.pictureUrl != null ? Resource.url(loginPageConfig.pictureUrl!) : null,
                constraints: BoxConstraints.loose(const Size(200, 200)),
                onTap: () async {
                  final result = await GoRouter.of(context).pushNamed<ThemeAssetModel>(
                    SchemeRoute.assetsScheme.name,
                    extra: [ThemeAssetType.vectorImage],
                  );
                  callback(loginPageConfig.copyWith(
                    metadata: loginPageConfig.metadata.copyWithKey(LoginPageConfig.pictureKey, result?.url),
                  ));
                },
              )
            ]),
          ),
          BorderContainer(
            title: 'Login Mode Select Page Config',
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<ElevatedButtonStyleType>(
                  value: ElevatedButtonStyleType.primary,
                  decoration: const InputDecoration(labelText: 'Login Button Style'),
                  items: ElevatedButtonStyleType.values
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.toString().split('.').last),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      callback(loginPageConfig.copyWith(
                          modeSelect: loginPageConfig.modeSelect.copyWith(buttonLoginStyleType: value)));
                    }
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ElevatedButtonStyleType>(
                  value: ElevatedButtonStyleType.primary,
                  decoration: const InputDecoration(labelText: 'Signup Button Style'),
                  items: ElevatedButtonStyleType.values
                      .map((type) => DropdownMenuItem(
                            value: type,
                            child: Text(type.toString().split('.').last),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      callback(loginPageConfig.copyWith(
                          modeSelect: loginPageConfig.modeSelect.copyWith(buttonSignupStyleType: value)));
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
