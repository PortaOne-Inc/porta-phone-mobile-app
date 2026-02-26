// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_history_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeHistoryEntryDto _$ThemeHistoryEntryDtoFromJson(
  Map<String, dynamic> json,
) => _ThemeHistoryEntryDto(
  id: json['id'] as String,
  themeId: json['themeId'] as String,
  applicationId: json['applicationId'] as String,
  snapshotVersion: (json['snapshotVersion'] as num).toInt(),
  action: json['action'] as String,
  createdAt: json['createdAt'] as String,
  changedBy: json['changedBy'] as String?,
  snapshot: json['snapshot'] as Map<String, dynamic>?,
  schemaVersion: (json['schemaVersion'] as num?)?.toInt() ?? 0,
  tag: json['tag'] as String? ?? '',
  description: json['description'] as String? ?? '',
  shareTokenId: json['shareTokenId'] as String?,
);

Map<String, dynamic> _$ThemeHistoryEntryDtoToJson(
  _ThemeHistoryEntryDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'themeId': instance.themeId,
  'applicationId': instance.applicationId,
  'snapshotVersion': instance.snapshotVersion,
  'action': instance.action,
  'createdAt': instance.createdAt,
  'changedBy': instance.changedBy,
  'snapshot': instance.snapshot,
  'schemaVersion': instance.schemaVersion,
  'tag': instance.tag,
  'description': instance.description,
  'shareTokenId': instance.shareTokenId,
};
