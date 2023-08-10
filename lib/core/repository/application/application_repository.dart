import 'package:webtrit_configurator/core/core.dart';

abstract class ApplicationRepository {
  Future<ApplicationDTO> updateApplication(String applicationId, ApplicationDTO applicationDTO);

  Future<ApplicationDTO> createApplication(ApplicationDTO applicationDTO);

  Future deleteApplication(String applicationId);

  Future<ApplicationDTO> incApplicationVersion(String applicationId);

  Future<List<ApplicationDTO>> getUserApplications();

  Future<ApplicationDTO> getApplication(String id);
}
