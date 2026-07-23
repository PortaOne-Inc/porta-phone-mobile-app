import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import 'package:data/datasource/datasource.dart';
import 'package:data/dto/dto.dart';
import '../common/api_exception_mapper.dart';

import '../mappers/mapper.dart';

@Injectable(as: PublicationResourcesRepository)
class PublicationResourcesRepositoryImpl extends PublicationResourcesRepository {
  PublicationResourcesRepositoryImpl({required this.datasource, required this.mapper});

  final ConfiguratorBackandDatasource datasource;
  final CommonMapper<PublicationResourceModel, PublicationResourceDto> mapper;

  @override
  Future<List<PublicationResourceModel>> getApplicationResources(String applicationId) => guardApiCall(() async {
    final dtos = await datasource.getAll(applicationId);
    return dtos.map(mapper.convertFrom).toList();
  });

  @override
  Future<PublicationResourceModel> createResource(
    String applicationId, {
    String? title,
    String? url,
    String? note,
    String? text,
  }) => guardApiCall(() async {
    final dto = await datasource.create(applicationId, title: title, url: url, note: note, text: text);
    return mapper.convertFrom(dto);
  });

  @override
  Future<PublicationResourceModel> updateResource(
    String id, {
    String? title,
    String? url,
    String? note,
    String? text,
  }) => guardApiCall(() async {
    final dto = await datasource.update(id, title: title, url: url, note: note, text: text);
    return mapper.convertFrom(dto);
  });

  @override
  Future<void> deleteResource(String id) => guardApiCall(() => datasource.delete(id));
}
