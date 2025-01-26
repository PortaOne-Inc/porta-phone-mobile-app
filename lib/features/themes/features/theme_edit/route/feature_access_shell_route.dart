import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_phone/data/data.dart';

import '../bloc/update_theme_cubit.dart';
import '../mocks/mocks.dart';

class FeatureAccessShellRoute extends StatelessWidget {
  const FeatureAccessShellRoute({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UpdateThemCubit, UpdateThemeState, AppConfig>(
      selector: (state) => state.appConfig,
      builder: (context, appConfig) {
        return FutureProvider<FeatureAccess>(
          key: ValueKey(appConfig),
          create: (_) async => FeatureAccess.init(appConfig, MockAppPreferences()),
          initialData: FeatureAccess.init(appConfig, MockAppPreferences()),
          child: child,
        );
      },
    );
  }
}
