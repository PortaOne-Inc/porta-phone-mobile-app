import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../common/api_exception_mapper.dart';
import '../datasource/configurator_backend/configurator_backand_datasource.dart';
import '../dto/theme/theme_history_entry_dto.dart';
import '../mappers/mapper.dart';

@Injectable(as: ThemeHistoryRepository)
class ThemeHistoryRepositoryImpl extends ThemeHistoryRepository {
  ThemeHistoryRepositoryImpl(this._api, this._mapper);

  final ConfiguratorBackandDatasource _api;
  final CommonMapper<ThemeHistoryEntryModel, ThemeHistoryEntryDto> _mapper;

  @override
  Future<ThemeHistoryPageModel> getHistory({
    required String applicationId,
    required String themeId,
    int? limit,
    String? startAfter,
  }) => guardApiCall(() async {
    final page = await _api.getThemeHistory(
      applicationId: applicationId,
      themeId: themeId,
      limit: limit,
      startAfter: startAfter,
    );
    return ThemeHistoryPageModel(items: page.items.map(_mapper.convertFrom).toList(), nextCursor: page.nextCursor);
  });

  @override
  Future<ThemeHistoryEntryModel> createSnapshot({
    required String applicationId,
    required String themeId,
    String? tag,
    String? description,
  }) => guardApiCall(() async {
    final dto = await _api.createThemeHistorySnapshot(
      applicationId: applicationId,
      themeId: themeId,
      tag: tag,
      description: description,
    );
    return _mapper.convertFrom(dto);
  });

  @override
  Future<ThemeHistoryEntryModel> updateEntry({
    required String applicationId,
    required String themeId,
    required String historyId,
    String? tag,
    String? description,
  }) => guardApiCall(() async {
    final dto = await _api.patchThemeHistoryEntry(
      applicationId: applicationId,
      themeId: themeId,
      historyId: historyId,
      tag: tag,
      description: description,
    );
    return _mapper.convertFrom(dto);
  });
}
