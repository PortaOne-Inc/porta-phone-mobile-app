import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

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
  }) async {
    try {
      final page = await _api.getThemeHistory(
        applicationId: applicationId,
        themeId: themeId,
        limit: limit,
        startAfter: startAfter,
      );
      return ThemeHistoryPageModel(
        items: page.items.map(_mapper.convertFrom).toList(),
        nextCursor: page.nextCursor,
      );
    } on DioException catch (e) {
      throw BaseException(
        message: e.response?.data?.toString() ?? e.message ?? 'Network error',
      );
    } catch (e) {
      throw BaseException(message: e.toString());
    }
  }
}
