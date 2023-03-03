import 'package:webtrit_configurator/share/share.dart';

abstract class VendorRepository {
  Future<VendorDTO> updateApplication(String userId, VendorDTO applicationDTO);

  Future<VendorDTO> createApplication(String userId, VendorDTO applicationDTO);

  Future<VendorDTO> deleteApplication(String userId, VendorDTO applicationDTO);

  Future<List<VendorDTO>> getUserApplications(String userId);
}
