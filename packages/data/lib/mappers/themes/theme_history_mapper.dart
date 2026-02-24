import 'package:injectable/injectable.dart';

import 'package:domain/domain.dart';

import '../../dto/theme/theme_history_entry_dto.dart';
import '../mapper.dart';

@Injectable(as: CommonMapper<ThemeHistoryEntryModel, ThemeHistoryEntryDto>)
class ThemeHistoryMapper
    extends CommonMapper<ThemeHistoryEntryModel, ThemeHistoryEntryDto> {
  @override
  ThemeHistoryEntryModel convertFrom(ThemeHistoryEntryDto it) {
    return ThemeHistoryEntryModel(
      id: it.id,
      themeId: it.themeId,
      applicationId: it.applicationId,
      snapshotVersion: it.snapshotVersion,
      action: it.action,
      changedBy: it.changedBy,
      createdAt: it.createdAt,
      snapshot: it.snapshot,
    );
  }

  @override
  ThemeHistoryEntryDto convertTo(ThemeHistoryEntryModel it) {
    return ThemeHistoryEntryDto(
      id: it.id,
      themeId: it.themeId,
      applicationId: it.applicationId,
      snapshotVersion: it.snapshotVersion,
      action: it.action,
      changedBy: it.changedBy,
      createdAt: it.createdAt,
      snapshot: it.snapshot,
    );
  }
}
