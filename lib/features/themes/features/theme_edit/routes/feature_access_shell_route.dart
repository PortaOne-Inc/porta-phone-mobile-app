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
    final mockAppPreferences = MockAppPreferences();
    final packageInfoMock = PackageInfoMock();
    final deviceInfo = DeviceInfoMock();

    return BlocSelector<UpdateThemCubit, UpdateThemeState, AppConfig>(
      selector: (state) => state.appConfig,
      builder: (context, appConfig) {
        final featureAccess = FeatureAccess.init(appConfig, mockAppPreferences);

        return MultiProvider(
          providers: [
            Provider<MockAppPreferences>.value(value: mockAppPreferences),
            Provider<DeviceInfo>.value(value: deviceInfo),
            Provider<PackageInfo>.value(value: packageInfoMock),
            FutureProvider<FeatureAccess>.value(
              value: Future.value(featureAccess),
              initialData: featureAccess,
            ),
          ],
          child: child,
        );
      },
    );
  }
}
