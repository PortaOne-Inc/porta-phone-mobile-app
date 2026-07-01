import 'dart:async';

import 'package:flutter/material.dart';

import 'package:domain/domain.dart';
import 'package:webtrit_phone/app/firebase_integration.dart';
import 'package:webtrit_phone/bootstrap.dart';
import 'package:webtrit_phone/common/common.dart';
import 'package:webtrit_phone/data/feature_access.dart';
import 'package:webtrit_phone/environment_config.dart';
import 'package:webtrit_phone/main.dart';
import 'package:webtrit_phone/theme/theme.dart';

import 'package:webtrit_configurator/features/themes/features/theme_edit/widgets/mock_device.dart';

import '../dart_define_overrides.dart';

/// Realtime preview surface: boots the real `webtrit_phone` application
/// in-process and renders it inside the shared device frame.
///
/// The currently edited [themeSettings] / [themeMode] / [featureAccess] are fed
/// into the live app through `RootApp`'s caller-supplied config sources, so edits
/// reflect without persisting to the embedded app's local preferences. The app
/// runs Firebase-free via [FirebaseIntegrationDisabled] (the configurator owns
/// the default Firebase app). The application's environment map (the
/// `WEBTRIT_APP_*` dart-define values configured in the configurator) is injected
/// into [EnvironmentConfig] before bootstrap, so the embedded app runs against
/// the same backend/config as a real deploy. The heavy [bootstrap] runs once and
/// is cached for the lifetime of this state.
class RealtimePreview extends StatefulWidget {
  const RealtimePreview({
    required this.featureAccess,
    required this.themeMode,
    required this.themeSettings,
    required this.isFrameVisible,
    this.applicationId,
    this.environmentUsecase,
    this.environment,
    this.dartDefineOverrides = const {},
    this.defaultWebBundleId,
    super.key,
  });

  /// The application whose saved environment is loaded before booting (via
  /// [environmentUsecase], the editor path). Null in the public shared preview,
  /// which instead receives a pre-loaded [environment].
  final String? applicationId;

  final GetApplicationEnvironmentUsecase? environmentUsecase;

  /// Pre-loaded dart-define environment (the shared preview path): applied as
  /// runtime overrides before booting so the embedded app runs against the real
  /// backend. Null in the editor path, which loads it via [environmentUsecase].
  final Map<String, dynamic>? environment;

  /// Temporary, in-preview dart-define overrides layered on top of the saved
  /// application environment (never persisted to the backend).
  final Map<String, String> dartDefineOverrides;

  /// Default `WEBTRIT_APP_WEB_BUNDLE_ID` for the embedded app (the application's
  /// platform identifier), used when the saved environment does not set one.
  final String? defaultWebBundleId;

  final FeatureAccess? featureAccess;

  final ThemeMode themeMode;

  final ThemeSettings themeSettings;

  final bool isFrameVisible;

  @override
  State<RealtimePreview> createState() => _RealtimePreviewState();
}

class _RealtimePreviewState extends State<RealtimePreview> {
  late final Future<InstanceRegistry> _bootstrap;

  final StreamController<ThemeSettings> _themeSettingsController = StreamController<ThemeSettings>.broadcast();
  final StreamController<ThemeMode> _themeModeController = StreamController<ThemeMode>.broadcast();
  final StreamController<FeatureAccess> _featureAccessController = StreamController<FeatureAccess>.broadcast();

  bool _seeded = false;

  @override
  void initState() {
    super.initState();
    _bootstrap = _prepareAndBootstrap();
  }

  /// Loads the application's dart-define environment and applies it as runtime
  /// overrides before booting, so [EnvironmentConfig] resolves to the configured
  /// values instead of the configurator's compile-time defaults. Skipped when no
  /// environmentUsecase/applicationId is supplied (the public shared preview has
  /// no backend access): the app then boots with compile-time defaults. Boots
  /// Firebase-free since the configurator owns the default Firebase app.
  Future<InstanceRegistry> _prepareAndBootstrap() async {
    final usecase = widget.environmentUsecase;
    final applicationId = widget.applicationId;
    var environment = widget.environment;
    if (usecase != null && applicationId != null) {
      environment = await usecase.execute(applicationId: applicationId);
    }
    if (environment != null) {
      final bundleId = widget.defaultWebBundleId;
      EnvironmentConfig.applyOverrides(
        resolveDartDefineOverrides(
          environment: environment,
          temporary: widget.dartDefineOverrides,
          // Default the web bundle id to the application's platform identifier so
          // the embedded app sends a backend-registered bundle_id on
          // session/autoprovision; the saved environment or a temporary override
          // still take precedence.
          defaults: {if (bundleId != null && bundleId.isNotEmpty) EnvironmentConfig.WEB_BUNDLE_ID__NAME: bundleId},
        ),
      );
    }
    return bootstrap(firebase: const FirebaseIntegrationDisabled());
  }

  @override
  void didUpdateWidget(covariant RealtimePreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.themeSettings != widget.themeSettings) {
      _themeSettingsController.add(widget.themeSettings);
    }
    if (oldWidget.themeMode != widget.themeMode) {
      _themeModeController.add(widget.themeMode);
    }
    final featureAccess = widget.featureAccess;
    if (featureAccess != null && oldWidget.featureAccess != featureAccess) {
      _featureAccessController.add(featureAccess);
    }
  }

  @override
  void dispose() {
    _themeSettingsController.close();
    _themeModeController.close();
    _featureAccessController.close();
    super.dispose();
  }

  /// Pushes the current theme once the live app has subscribed, overriding the
  /// embedded app's asset-loaded default with the configurator's edited theme.
  void _seedInitialTheme() {
    if (_seeded) return;
    _seeded = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _themeSettingsController.add(widget.themeSettings);
      _themeModeController.add(widget.themeMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<InstanceRegistry>(
      future: _bootstrap,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return _RealtimePreviewError(error: snapshot.error!);
        }

        final registry = snapshot.data;
        if (registry == null) {
          return const Center(child: CircularProgressIndicator());
        }

        _seedInitialTheme();

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: TypeOfPreview(
            isFrameVisible: widget.isFrameVisible,
            constraints: const BoxConstraints(),
            child: RootApp(
              instanceRegistry: registry,
              // The configurator owns the browser URL; keep the embedded app's
              // router internal so it doesn't rewrite window.history.
              ownsBrowserHistory: false,
              // FeatureAccess is required: fall back to the embedded app's
              // bootstrap-built value when the configurator supplies none.
              featureAccess: (
                initial: widget.featureAccess ?? registry.get<FeatureAccess>(),
                updates: () => _featureAccessController.stream,
              ),
              themeSettings: (initial: widget.themeSettings, updates: () => _themeSettingsController.stream),
              themeMode: (initial: widget.themeMode, updates: () => _themeModeController.stream),
            ),
          ),
        );
      },
    );
  }
}

class _RealtimePreviewError extends StatelessWidget {
  const _RealtimePreviewError({required this.error});

  final Object error;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error_outline, color: colorScheme.error, size: 40),
            const SizedBox(height: 12),
            Text('Failed to launch realtime preview', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('$error', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}
