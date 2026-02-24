// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_history_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeHistoryEntryModel _$ThemeHistoryEntryModelFromJson(
  Map<String, dynamic> json,
) => _ThemeHistoryEntryModel(
  id: json['id'] as String,
  themeId: json['themeId'] as String,
  applicationId: json['applicationId'] as String,
  snapshotVersion: (json['snapshotVersion'] as num).toInt(),
  action: json['action'] as String,
  createdAt: json['createdAt'] as String,
  changedBy: json['changedBy'] as String?,
  snapshot: json['snapshot'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ThemeHistoryEntryModelToJson(
  _ThemeHistoryEntryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'themeId': instance.themeId,
  'applicationId': instance.applicationId,
  'snapshotVersion': instance.snapshotVersion,
  'action': instance.action,
  'createdAt': instance.createdAt,
  'changedBy': instance.changedBy,
  'snapshot': instance.snapshot,
};
