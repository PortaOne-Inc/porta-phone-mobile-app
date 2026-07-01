import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resizable_columns/resizable_columns.dart';

import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/theme_edit.dart' hide LoginType;
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_configurator/widgets/screen_error_boundary.dart';
import 'package:webtrit_phone/data/feature_access.dart';
import 'package:domain/domain.dart';

class PreviewLayoutView extends StatefulWidget {
  const PreviewLayoutView({
    required this.frameVisibility,
    required this.mode,
    this.dartDefineOverrides = const {},
    super.key,
  });

  final bool frameVisibility;

  /// Selected preview fidelity (static snapshots, interactive snapshots, or the
  /// live in-process app).
  final PreviewMode mode;

  /// Temporary dart-define overrides applied to the realtime preview only.
  final Map<String, String> dartDefineOverrides;

  @override
  State<PreviewLayoutView> createState() => _PreviewLayoutViewState();
}

class _PreviewLayoutViewState extends State<PreviewLayoutView> {
  static const _initialColumnProportions = [0.75, 0.25];
  static const _dividerThickness = 4.0;

  int _focusScreenPosition = 0;
  ErrorWidgetBuilder? _defaultErrorBuilder;

  List<Widget> _cachedScreenshots = [];
  FeatureAccess? _lastFeatureAccess;
  ThemeMode? _lastThemeMode;
  ThemeSettings? _lastThemeSettings;
  bool? _lastInteractive;

  @override
  void initState() {
    super.initState();
    _defaultErrorBuilder = ErrorWidget.builder;
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return ErrorScreenPlaceholder(details: details);
    };
  }

  @override
  void dispose() {
    if (_defaultErrorBuilder != null) {
      ErrorWidget.builder = _defaultErrorBuilder!;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final featureAccess = context.watch<FeatureAccess?>();

    if (widget.mode.isRealtime) {
      final cubit = context.watch<UpdateThemCubit>();
      final cubitState = cubit.state;
      final selectedVariant = cubitState.selectedVariant;
      final themeMode = selectedVariant == BrightnessVariant.dark ? ThemeMode.dark : ThemeMode.light;
      final application = cubitState.applicationModel;
      final overrides = widget.dartDefineOverrides;
      return Align(
        child: RealtimePreview(
          // Re-bootstrap the embedded app whenever the dart-define overrides change.
          key: ValueKey(overrides.entries.map((entry) => '${entry.key}=${entry.value}').join('&')),
          applicationId: cubit.applicationId,
          environmentUsecase: context.read<GetApplicationEnvironmentUsecase>(),
          dartDefineOverrides: overrides,
          defaultWebBundleId: application?.androidPlatformId ?? application?.iosPlatformId,
          featureAccess: featureAccess,
          themeMode: themeMode,
          themeSettings: cubitState.themeSettings,
          isFrameVisible: widget.frameVisibility,
        ),
      );
    }

    final interactive = widget.mode.isInteractive;

    // Read config directly from the cubit state instead of ThemeProvider.
    // When context.watch<UpdateThemCubit>() triggers a rebuild, ThemeProvider
    // (updated by a separate BlocBuilder higher in the tree) may not have
    // propagated yet in the same frame. Reading from the cubit state
    // guarantees we always compare against the latest config values.
    final cubitState = context.watch<UpdateThemCubit>().state;
    final selectedVariant = cubitState.selectedVariant;

    final themeMode = selectedVariant == BrightnessVariant.dark ? ThemeMode.dark : ThemeMode.light;

    final themeSettings = cubitState.themeSettings;

    if (featureAccess != _lastFeatureAccess ||
        themeMode != _lastThemeMode ||
        themeSettings != _lastThemeSettings ||
        interactive != _lastInteractive) {
      _lastFeatureAccess = featureAccess;
      _lastThemeMode = themeMode;
      _lastThemeSettings = themeSettings;
      _lastInteractive = interactive;
      _cachedScreenshots = buildPreviewScreenshots(
        featureAccess: featureAccess,
        themeMode: themeMode,
        themeSettings: themeSettings,
        interactive: interactive,
      );
    }

    final screenshots = _cachedScreenshots;

    final focusPosition = screenshots.isEmpty ? 0 : _focusScreenPosition.clamp(0, screenshots.length - 1);

    return ResizableColumns(
      initialProportions: _initialColumnProportions,
      dividerColor: Theme.of(context).colorScheme.surfaceContainerLow,
      dividerThickness: _dividerThickness,
      orientation: ResizableOrientation.vertical,
      children: [
        (_) => Align(
          child: TypePreview(
            screens: screenshots,
            screenFocus: focusPosition,
            isFrameVisible: widget.frameVisibility,
            interactive: interactive,
          ),
        ),
        (_) =>
            DrawerPreview(screenshots: screenshots, focusScreenPosition: focusPosition, onTapScreen: _setFocusedScreen),
      ],
    );
  }

  void _setFocusedScreen(int position) {
    setState(() {
      _focusScreenPosition = position;
    });
  }
}
