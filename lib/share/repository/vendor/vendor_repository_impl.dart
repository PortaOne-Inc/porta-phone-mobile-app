import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/core/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

@Injectable(as: VendorRepository)
class VendorRepositoryImpl extends VendorRepository {
  HttpDatasource httpDatasource;

  VendorRepositoryImpl({
    required this.httpDatasource,
  });

  @override
  Future<VendorDTO> createApplication(String userId, VendorDTO applicationDTO) async {
    try {
      return await httpDatasource.createApplications(applicationDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<VendorDTO>> getUserApplications(String userId) async {
    try {
      return await httpDatasource.getApplications();
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<VendorDTO> deleteApplication(String userId, VendorDTO applicationDTO) async {
    try {
      return await httpDatasource.deleteApplications(applicationDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<VendorDTO> updateApplication(String userId, VendorDTO applicationDTO) async {
    try {
      return await httpDatasource.updateApplications(applicationDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
