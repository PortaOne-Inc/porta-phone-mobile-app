import 'package:dto/dto.dart';

abstract class ApplicationRepository {
  Future<ApplicationDTO> updateApplication(String applicationId, ApplicationDTO applicationDTO);

  Future<ApplicationDTO> createApplication(ApplicationDTO applicationDTO);

  Future<void> deleteApplication(String applicationId);

  Future<ApplicationDTO> incApplicationVersion(String applicationId);

  Future<List<ApplicationDTO>> getUserApplications();

  Future<ApplicationDTO> getApplication(String id);
}
