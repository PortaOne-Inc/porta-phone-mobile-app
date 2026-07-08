import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:webtrit_configurator/core/core.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/features/preview/features/preview_required/view/preview_required.dart';
import 'package:webtrit_configurator/mocks/mocks.dart';
import 'package:webtrit_phone/data/data.dart';
import 'package:webtrit_phone/models/feature_access/feature_access.dart';
import 'package:webtrit_phone/services/remote_config_service.dart';
import 'package:webtrit_phone/utils/utils.dart';

import '../bloc/update_theme_cubit.dart';
import '../mocks/mocks.dart';

/// A wrapper widget that provides feature access configuration for app preview screens.
class FeatureAccessShellRoute extends StatelessWidget {
  const FeatureAccessShellRoute({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (context, state) {
        final hasNavigation = state.loadedComponents.contains(ThemeComponents.navigation);
        final hasEmbeds = state.loadedComponents.contains(ThemeComponents.embeds);

        if (!hasNavigation || !hasEmbeds) {
          return const LoadingScreen(status: LoadingStatus.fetchingResources);
        }

        final appConfig = state.appConfig;
        final systemInfo = SystemInfoBuilder(
          adapterSupported: state.effectivePreviewCapabilities,
          coreVersion: state.previewCoreVersion,
        ).buildInfo();
        final featureOverrides = FeatureOverridesFactory.create(
          RemoteConfigSnapshot(<String, String>{}, MockRemoteCacheConfigService()),
        );

        final coreSupport = CoreSupportFactory.create(systemInfo);

        try {
          final featureAccess = FeatureAccess.create(
            appConfig,
            state.embeddedResources.where((it) => it.id != null).map((it) => it.toEmbeddedResource()).toList(),
            coreSupport,
            systemInfo,
            featureOverrides,
          );
          return ProvidersWrapper(featureAccess: featureAccess, child: child);
        } catch (e) {
          return PreviewRequired(exception: e);
        }
      },
    );
  }
}

enum LoadingStatus { loadingTheme, fetchingResources }

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({required this.status, super.key});

  final LoadingStatus status;

  String get message {
    switch (status) {
      case LoadingStatus.loadingTheme:
        return 'Loading theme...';
      case LoadingStatus.fetchingResources:
        return 'Fetching resources...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [const CircularProgressIndicator(strokeWidth: 2), const SizedBox(height: 16), Text(message)],
      ),
    );
  }
}

class ProvidersWrapper extends StatelessWidget {
  const ProvidersWrapper({required this.featureAccess, required this.child, super.key});

  final FeatureAccess featureAccess;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppPreferences>.value(value: MockAppPreferences()),
        Provider<DeviceInfo>.value(value: DeviceInfoMock()),
        Provider<MockAppMetadataProvider>.value(value: const MockAppMetadataProvider()),
        Provider<FeatureAccess>.value(value: featureAccess),
      ],
      child: child,
    );
  }
}
