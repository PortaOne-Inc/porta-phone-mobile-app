import 'package:domain/domain.dart';

abstract class ApplicationRepository {
  Future<ApplicationModel> updateApplication(
    String applicationId,
    ApplicationModel model,
  );

  Future<ApplicationModel> createApplication(ApplicationModel model);

  Future<void> deleteApplication(String applicationId);

  Future<ApplicationModel> incApplicationVersion(String applicationId);

  Future<List<ApplicationModel>> getUserApplications();

  Future<ApplicationModel> getApplication(String id);

  Future<Map<String, dynamic>> getApplicationEnvironment(String applicationId);

  Future<Map<String, dynamic>> updateApplicationEnvironment(
    String applicationId,
    Map<String, dynamic> environment,
  );

  Future<ApplicationModel> updateThemeBindings(
    String applicationId, {
    String? defaultThemeId,
    Map<String, String>?
    themeByEnv, // e.g. {'dev': 'themeDevId', 'stage': '...', 'prod': '...'}
  });

  /// Resolve effective themeId for a build based on [env] ('dev' | 'stage' | 'prod').
  /// Server selects by priority: themeByEnv[env] -> theme (fallback) -> label==env -> first available.
  Future<String> resolveThemeIdForBuild(
    String applicationId, {
    String env = 'prod',
  });
}
