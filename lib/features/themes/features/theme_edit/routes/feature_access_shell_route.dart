import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_configurator/features/themes/features/theme_edit/features/preview/features/preview_required/view/preview_required.dart';
import 'package:webtrit_phone/data/data.dart';

import '../bloc/update_theme_cubit.dart';
import '../mocks/mocks.dart';

/// A wrapper widget that provides feature access configuration and ensures correct asset rendering
/// in app preview screens by mapping local assets to data URIs.
class FeatureAccessShellRoute extends StatelessWidget {
  const FeatureAccessShellRoute({
    required this.child,
    super.key,
  });

  final Widget child;

  /// Cache to store converted data URIs for HTML assets, avoiding redundant network requests.
  static final _htmlDataUriCache = HashMap<String, String>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateThemCubit, UpdateThemeState>(
      builder: (context, state) {
        if (state.theme == null) {
          return const LoadingScreen(status: LoadingStatus.loadingTheme);
        }

        return FutureBuilder<AppConfig>(
          future: _replaceLocalAssetsWithDataUri(state.appConfig),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const LoadingScreen(status: LoadingStatus.initializingPreview);
            }

            try {
              final featureAccess = FeatureAccess.init(
                snapshot.data!,
                MockAppPreferences(),
              );

              return ProvidersWrapper(
                featureAccess: featureAccess,
                child: child,
              );
            } catch (e) {
              return PreviewRequired(exception: e);
            }
          },
        );
      },
    );
  }

  Future<AppConfig> _replaceLocalAssetsWithDataUri(AppConfig appConfig) async {
    final updatedResources = await Future.wait(
      appConfig.embeddedResources.map(_convertResourceToDataUri),
    );

    return appConfig.copyWith(embeddedResources: updatedResources);
  }

  Future<EmbeddedResource> _convertResourceToDataUri(EmbeddedResource resource) async {
    final uri = resource.uriOrNull;
    if (uri == null || _htmlDataUriCache.containsKey(uri.toString())) {
      return resource.copyWith(uri: _htmlDataUriCache[uri.toString()] ?? resource.uri);
    }

    try {
      final response = await http.get(uri).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Request timed out');
        },
      );

      if (response.statusCode == 200) {
        final dataUri = Uri.dataFromBytes(response.bodyBytes, mimeType: 'text/html').toString();
        _htmlDataUriCache[uri.toString()] = dataUri;
        return resource.copyWith(uri: dataUri);
      }
    } catch (e) {
      // TODO(Serdun): Work with design to determine fallback HTML content
      final fallbackHtml = '''
      <!DOCTYPE html>
      <html>
      <head><title>Failed to Load</title></head>
      <body>
        <h1>Failed to Display Content</h1>
        <p>$e</p>
      </body>
      </html>
    ''';
      final fallbackDataUri = Uri.dataFromString(fallbackHtml, mimeType: 'text/html').toString();
      return resource.copyWith(uri: fallbackDataUri);
    }

    return resource;
  }
}

enum LoadingStatus {
  loadingTheme,
  initializingPreview,
  fetchingResources,
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({required this.status, super.key});

  final LoadingStatus status;

  String get message {
    switch (status) {
      case LoadingStatus.loadingTheme:
        return 'Loading theme...';
      case LoadingStatus.initializingPreview:
        return 'Initializing preview...';
      case LoadingStatus.fetchingResources:
        return 'Fetching resources...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(strokeWidth: 2),
          const SizedBox(height: 16),
          Text(message),
        ],
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
        Provider<MockAppPreferences>.value(value: MockAppPreferences()),
        Provider<DeviceInfo>.value(value: DeviceInfoMock()),
        Provider<PackageInfo>.value(value: PackageInfoMock()),
        FutureProvider<FeatureAccess>.value(
          key: ValueKey(featureAccess),
          value: Future.value(featureAccess),
          initialData: featureAccess,
        ),
      ],
      child: child,
    );
  }
}
