import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:webtrit_configurator/core/core.dart';
import 'package:webtrit_phone/data/data.dart';

import '../bloc/update_theme_cubit.dart';
import '../mocks/mocks.dart';
import 'package:http/http.dart' as http;

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
    return BlocSelector<UpdateThemCubit, UpdateThemeState, AppConfig>(
      selector: (state) => state.appConfig,
      builder: (context, appConfig) {
        return FutureBuilder<AppConfig>(
          future: _replaceLocalAssetsWithDataUri(appConfig),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox.shrink();
            }

            final updatedAppConfig = snapshot.data!;
            final mockAppPreferences = MockAppPreferences();
            final packageInfoMock = PackageInfoMock();
            final deviceInfo = DeviceInfoMock();
            final featureAccess = FeatureAccess.init(updatedAppConfig, mockAppPreferences);

            return MultiProvider(
              providers: [
                Provider<MockAppPreferences>.value(value: mockAppPreferences),
                Provider<DeviceInfo>.value(value: deviceInfo),
                Provider<PackageInfo>.value(value: packageInfoMock),
                FutureProvider<FeatureAccess>.value(
                  key: ValueKey(featureAccess),
                  value: Future.value(featureAccess),
                  initialData: featureAccess,
                ),
              ],
              child: child,
            );
          },
        );
      },
    );
  }

  /// Converts local asset URIs to data URIs to ensure proper rendering of embedded resources
  /// in environments where local assets are unavailable (e.g., web previews).
  Future<AppConfig> _replaceLocalAssetsWithDataUri(AppConfig appConfig) async {
    final updatedResources = <EmbeddedResource>[];

    for (final resource in appConfig.embeddedResources) {
      final uri = resource.uriOrNull;
      if (uri != null) {
        if (_htmlDataUriCache.containsKey(uri.toString())) {
          // Use cached data URI if available
          updatedResources.add(resource.copyWith(uri: _htmlDataUriCache[uri.toString()]!));
        } else {
          try {
            final response = await http.get(uri);
            if (response.statusCode == 200) {
              // Convert the fetched asset data to a base64-encoded data URI
              final dataUri = Uri.dataFromBytes(
                response.bodyBytes,
                mimeType: 'text/html',
              ).toString();
              _htmlDataUriCache[uri.toString()] = dataUri;
              updatedResources.add(resource.copyWith(uri: dataUri));
            } else {
              updatedResources.add(resource);
            }
          } catch (_) {
            updatedResources.add(resource);
          }
        }
      } else {
        updatedResources.add(resource);
      }
    }

    return appConfig.copyWith(embeddedResources: updatedResources);
  }
}
 