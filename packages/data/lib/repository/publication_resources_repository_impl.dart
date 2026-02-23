import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';

import '../mappers/mapper.dart';

@Injectable(as: PublicationResourcesRepository)
class PublicationResourcesRepositoryImpl
    extends PublicationResourcesRepository {
  PublicationResourcesRepositoryImpl({
    required this.datasource,
    required this.mapper,
  });

  final ConfiguratorBackandDatasource datasource;
  final CommonMapper<PublicationResourceModel, PublicationResourceDto> mapper;

  @override
  Future<List<PublicationResourceModel>> getApplicationResources(
    String applicationId,
  ) async {
    try {
      final dtos = await datasource.getAll(applicationId);
      return dtos.map(mapper.convertFrom).toList();
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    }
  }

  @override
  Future<PublicationResourceModel> createResource(
    String applicationId, {
    String? title,
    String? url,
    String? note,
    String? text,
  }) async {
    try {
      final dto = await datasource.create(
        applicationId,
        title: title,
        url: url,
        note: note,
        text: text,
      );
      return mapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    }
  }

  @override
  Future<PublicationResourceModel> updateResource(
    String id, {
    String? title,
    String? url,
    String? note,
    String? text,
  }) async {
    try {
      final dto = await datasource.update(
        id,
        title: title,
        url: url,
        note: note,
        text: text,
      );
      return mapper.convertFrom(dto);
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    }
  }

  @override
  Future<void> deleteResource(String id) async {
    try {
      await datasource.delete(id);
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    }
  }
}
