import 'package:domain/domain.dart';

abstract class ApplicationRepository {
  Future<ApplicationModel> updateApplication(String applicationId, ApplicationModel model);

  Future<ApplicationModel> createApplication(ApplicationModel model);

  Future<void> deleteApplication(String applicationId);

  Future<ApplicationModel> incApplicationVersion(String applicationId);

  Future<List<ApplicationModel>> getUserApplications();

  Future<ApplicationModel> getApplication(String id);
}
