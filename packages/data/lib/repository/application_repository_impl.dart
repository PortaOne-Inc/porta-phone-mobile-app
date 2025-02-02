import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';
import 'package:data/mappers/mappers.dart';

import '../dto/dto.dart';

// TODO(DMITRO): Models can be used in both the data and domain layers to ensure a proper way to return models from a repository.
// TODO(DMITRO): The domain layer should be aware of DTOs
@Injectable(as: ApplicationRepository)
class ApplicationRepositoryImpl extends ApplicationRepository {
  ApplicationRepositoryImpl({
    required this.configuratorBackandDatasource,
    required this.applicationMapper,
  });

  final ConfiguratorBackandDatasource configuratorBackandDatasource;
  final CommonMapper<ApplicationModel, ApplicationDTO> applicationMapper;

  @override
  Future<ApplicationModel> createApplication(ApplicationModel model) async {
    try {
      final dtoParam = applicationMapper.convertTo(model);
      final dto = await configuratorBackandDatasource.createApplications(dtoParam);
      return applicationMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<List<ApplicationModel>> getUserApplications() async {
    try {
      final dto = await configuratorBackandDatasource.getApplications();
      return applicationMapper.convertListFrom(dto);
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
  Future<ApplicationModel> updateApplication(String applicationId, ApplicationModel model) async {
    try {
      final dtoParam = applicationMapper.convertTo(model);
      final dto = await configuratorBackandDatasource.putApplication(applicationId, dtoParam);
      return applicationMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationModel> getApplication(String id) async {
    try {
      final dto = await configuratorBackandDatasource.getApplication(id);
      return applicationMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<ApplicationModel> incApplicationVersion(String applicationId) async {
    try {
      final dto = await configuratorBackandDatasource.incApplicationVersion(applicationId);
      return applicationMapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(message: e.response.toString());
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getApplicationEnvironment(String applicationId) async {
    try {
      return await configuratorBackandDatasource.getApplicationEnvironment(applicationId);
    } on DioException catch (e) {
      throw BaseException(message: e.response?.data.toString() ?? "Failed to fetch environment");
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> updateApplicationEnvironment(
      String applicationId, Map<String, dynamic> environment) async {
    try {
      return await configuratorBackandDatasource.updateApplicationEnvironment(applicationId, environment);
    } on DioException catch (e) {
      throw BaseException(message: e.response?.data.toString() ?? "Failed to update environment");
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
