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
  Future<ApplicationDTO> createApplication(String userId, ApplicationDTO applicationDTO) async {
    try {
      return await httpDatasource.createApplications(applicationDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<ApplicationDTO>> getUserApplications(String userId) async {
    try {
      return await httpDatasource.getApplications();
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> deleteApplication(String userId, ApplicationDTO applicationDTO) async {
    try {
      return await httpDatasource.deleteApplications(applicationDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> updateApplication(String userId, ApplicationDTO applicationDTO) async {
    try {
      return await httpDatasource.updateApplications(applicationDTO);
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
