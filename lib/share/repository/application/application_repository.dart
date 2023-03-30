import 'package:webtrit_configurator/share/share.dart';

abstract class ApplicationRepository {
  Future<ApplicationDTO> updateApplication(String userId, ApplicationDTO applicationDTO);

  Future<ApplicationDTO> createApplication(String userId, ApplicationDTO applicationDTO);

  Future<ApplicationDTO> deleteApplication(String userId, ApplicationDTO applicationDTO);

  Future<List<ApplicationDTO>> getUserApplications(String userId);
}
