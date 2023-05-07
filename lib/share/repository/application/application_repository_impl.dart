import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:webtrit_configurator/share/exception/exception.dart';
import 'package:webtrit_configurator/share/share.dart';

import 'application_repository.dart';

@Injectable(as: ApplicationRepository)
class ApplicationRepositoryImpl extends ApplicationRepository {
  HttpDatasource httpDatasource;

  ApplicationRepositoryImpl({
    required this.httpDatasource,
  });

  @override
  Future<ApplicationDTO> createApplication(String userId, ApplicationDTO applicationDTO) async {
    try {
      return await httpDatasource.createApplications(applicationDTO);
    } on DioError catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<ApplicationDTO>> getUserApplications(String userId) async {
    try {
      return await httpDatasource.getApplications();
    } on DioError catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future deleteApplication(String applicationId) async {
    try {
      return await httpDatasource.deleteApplications(applicationId);
    } on DioError catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> updateApplication(String applicationId, ApplicationDTO applicationDTO) async {
    try {
      return await httpDatasource.updateApplications(applicationId, applicationDTO);
    } on DioError catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> getApplication(String id) async {
    try {
      return await httpDatasource.getApplication(id);
    } on DioError catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> incApplicationVersion(String applicationId) async {
    try {
      return await httpDatasource.incApplicationVersion(applicationId);
    } on DioError catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
