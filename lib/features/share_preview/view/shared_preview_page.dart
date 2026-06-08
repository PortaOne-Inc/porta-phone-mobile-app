import 'dart:js_interop';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:web/web.dart' as web;

import 'package:domain/domain.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/exports/exports.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/mocks/mocks.dart';
import 'package:webtrit_configurator/features/themes/widgets/widgets.dart';
import 'package:webtrit_configurator/mocks/mocks.dart';
import 'package:webtrit_configurator/widgets/screen_error_boundary.dart';
import 'package:webtrit_phone/data/data.dart';
import 'package:webtrit_phone/models/models.dart';
import 'package:webtrit_phone/services/remote_config_service.dart';
import 'package:webtrit_phone/utils/utils.dart';

import '../bloc/shared_preview_cubit.dart';

class SharedPreviewPage extends StatelessWidget {
  const SharedPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SharedPreviewCubit, SharedPreviewState>(
      builder: (context, state) {
        return state.when(
          loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (message) => Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.error_outline, size: 64),
                    const SizedBox(height: 16),
                    Text('Failed to load preview', style: Theme.of(context).textTheme.headlineSmall),
                    const SizedBox(height: 8),
                    Text(message, textAlign: TextAlign.center),
                    const SizedBox(height: 24),
                    FilledButton(onPressed: context.read<SharedPreviewCubit>().retry, child: const Text('Retry')),
                  ],
                ),
              ),
            ),
          ),
          loaded: (data) => _SharedPreviewContent(data: data),
        );
      },
    );
  }
}

class _SharedPreviewContent extends StatefulWidget {
  const _SharedPreviewContent({required this.data});

  final SharedThemePreviewModel data;

  @override
  State<_SharedPreviewContent> createState() => _SharedPreviewContentState();
}

class _SharedPreviewContentState extends State<_SharedPreviewContent> {
  bool _isDark = false;
  bool _interactive = false;
  int _focusScreenPosition = 0;
  ErrorWidgetBuilder? _defaultErrorBuilder;
  final _previewKey = GlobalKey();

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

  ThemeSettings _buildThemeSettings() {
    final data = widget.data;
    final colorSchemeConfig = _isDark
        ? (data.colorSchemes.dark != null
              ? ColorSchemeConfig.fromJson(data.colorSchemes.dark!)
              : const ColorSchemeConfig())
        : (data.colorSchemes.light != null
              ? ColorSchemeConfig.fromJson(data.colorSchemes.light!)
              : const ColorSchemeConfig());
    final widgetConfig = _isDark
        ? (data.widgetConfigs.dark != null
              ? ThemeWidgetConfig.fromJson(data.widgetConfigs.dark!)
              : const ThemeWidgetConfig())
        : (data.widgetConfigs.light != null
              ? ThemeWidgetConfig.fromJson(data.widgetConfigs.light!)
              : const ThemeWidgetConfig());
    final pageConfig = _isDark
        ? (data.pageConfigs.dark != null ? ThemePageConfig.fromJson(data.pageConfigs.dark!) : const ThemePageConfig())
        : (data.pageConfigs.light != null
              ? ThemePageConfig.fromJson(data.pageConfigs.light!)
              : const ThemePageConfig());

    if (_isDark) {
      return ThemeSettings(
        darkColorSchemeConfig: colorSchemeConfig,
        themeWidgetDarkConfig: widgetConfig,
        themePageDarkConfig: pageConfig,
      );
    } else {
      return ThemeSettings(
        lightColorSchemeConfig: colorSchemeConfig,
        themeWidgetLightConfig: widgetConfig,
        themePageLightConfig: pageConfig,
      );
    }
  }

  FeatureAccess? _buildFeatureAccess() {
    final data = widget.data;
    final configJson = data.featureAccess?['config'] as Map<String, dynamic>?;
    if (configJson == null) return null;

    try {
      final appConfig = AppConfig.fromJson(configJson);
      final embeds = data.embeds
          .map(EmbeddedResourceModel.fromJson)
          .where((m) => m.id != null)
          .map((m) => m.toEmbeddedResource())
          .toList();
      final systemInfo = const SystemInfoBuilder().buildInfo();
      final featureOverrides = FeatureOverridesFactory.create(
        RemoteConfigSnapshot(<String, String>{}, MockRemoteCacheConfigService()),
      );
      final coreSupport = CoreSupportFactory.create(systemInfo);

      return FeatureAccess.create(appConfig, embeds, coreSupport, systemInfo, featureOverrides);
    } catch (_) {
      return null;
    }
  }

  Future<void> _downloadScreenshot() async {
    final boundary = _previewKey.currentContext?.findRenderObject() as RenderRepaintBoundary?;
    if (boundary == null) return;

    final image = await boundary.toImage(pixelRatio: 3);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) return;

    final bytes = byteData.buffer.asUint8List();
    final safeName = widget.data.themeName.replaceAll(RegExp(r'[^\w\s-]'), '').trim();
    final fileName = '${safeName}_screen_${_focusScreenPosition + 1}.png';

    final blob = web.Blob([bytes.toJS].toJS);
    final url = web.URL.createObjectURL(blob);
    web.HTMLAnchorElement()
      ..href = url
      ..setAttribute('download', fileName)
      ..click();
    web.URL.revokeObjectURL(url);
  }

  @override
  Widget build(BuildContext context) {
    final themeSettings = _buildThemeSettings();
    final themeMode = _isDark ? ThemeMode.dark : ThemeMode.light;
    final featureAccess = _buildFeatureAccess();
    final screenshots = buildPreviewScreenshots(
      featureAccess: featureAccess,
      themeMode: themeMode,
      themeSettings: themeSettings,
      interactive: _interactive,
    );

    final focusPosition = screenshots.isEmpty ? 0 : _focusScreenPosition.clamp(0, screenshots.length - 1);

    return ThemeProvider(
      settings: themeSettings,
      lightDynamic: null,
      darkDynamic: null,
      child: MultiProvider(
        providers: [
          Provider<AppPreferences>.value(value: MockAppPreferences()),
          Provider<DeviceInfo>.value(value: DeviceInfoMock()),
          Provider<MockAppMetadataProvider>.value(value: const MockAppMetadataProvider()),
          if (featureAccess != null) Provider<FeatureAccess>.value(value: featureAccess),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.data.themeName),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.download),
                tooltip: 'Download screenshot',
                onPressed: _downloadScreenshot,
              ),
              IconButton(
                icon: Icon(_interactive ? Icons.touch_app : Icons.touch_app_outlined),
                tooltip: _interactive ? 'Disable interaction' : 'Enable interaction',
                onPressed: () => setState(() {
                  _interactive = !_interactive;
                  _focusScreenPosition = 0;
                }),
              ),
              IconButton(
                icon: Icon(_isDark ? Icons.light_mode : Icons.dark_mode),
                tooltip: _isDark ? 'Switch to light' : 'Switch to dark',
                onPressed: () => setState(() {
                  _isDark = !_isDark;
                  _focusScreenPosition = 0;
                }),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Align(
                  child: RepaintBoundary(
                    key: _previewKey,
                    child: TypePreview(
                      screens: screenshots,
                      screenFocus: focusPosition,
                      isFrameVisible: true,
                      interactive: _interactive,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 160,
                child: DrawerPreview(
                  screenshots: screenshots,
                  focusScreenPosition: focusPosition,
                  onTapScreen: (index) => setState(() {
                    _focusScreenPosition = index;
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
