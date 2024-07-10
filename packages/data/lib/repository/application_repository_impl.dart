import 'package:dio/dio.dart';

import 'package:dto/dto.dart';

import 'package:domain/exception/exception.dart';
import 'package:domain/repository/repository.dart';

import 'package:data/datasource/datasource.dart';

import 'package:injectable/injectable.dart';

// TODO(DMITRO): Models can be used in both the data and domain layers to ensure a proper way to return models from a repository.
// TODO(DMITRO): The domain layer should be aware of DTOs
@Injectable(as: ApplicationRepository)
class ApplicationRepositoryImpl extends ApplicationRepository {
  ApplicationRepositoryImpl({
    required this.configuratorBackandDatasource,
  });

  final ConfiguratorBackandDatasource configuratorBackandDatasource;

  @override
  Future<ApplicationDTO> createApplication(ApplicationDTO applicationDTO) async {
    try {
      return await configuratorBackandDatasource.createApplications(applicationDTO);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<ApplicationDTO>> getUserApplications() async {
    try {
      return await configuratorBackandDatasource.getApplications();
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<void> deleteApplication(String applicationId) async {
    try {
      return await configuratorBackandDatasource.deleteApplications(applicationId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> updateApplication(String applicationId, ApplicationDTO applicationDTO) async {
    try {
      return await configuratorBackandDatasource.updateApplications(applicationId, applicationDTO);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> getApplication(String id) async {
    try {
      return await configuratorBackandDatasource.getApplication(id);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationDTO> incApplicationVersion(String applicationId) async {
    try {
      return await configuratorBackandDatasource.incApplicationVersion(applicationId);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
