import 'package:webtrit_configurator/share/share.dart';

abstract class ApplicationRepository {
  Future<ApplicationDTO> updateApplication(String applicationId, ApplicationDTO applicationDTO);

  Future<ApplicationDTO> createApplication(String userId, ApplicationDTO applicationDTO);

  Future deleteApplication(String applicationId);

  Future<ApplicationDTO> incApplicationVersion(String applicationId);

  Future<List<ApplicationDTO>> getUserApplications(String userId);

  Future<ApplicationDTO> getApplication(
    String id,
  );
}
