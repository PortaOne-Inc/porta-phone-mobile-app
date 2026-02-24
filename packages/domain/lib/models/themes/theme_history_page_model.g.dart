// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_history_page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeHistoryPageModel _$ThemeHistoryPageModelFromJson(
  Map<String, dynamic> json,
) => _ThemeHistoryPageModel(
  items: (json['items'] as List<dynamic>)
      .map((e) => ThemeHistoryEntryModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  nextCursor: json['nextCursor'] as String?,
);

Map<String, dynamic> _$ThemeHistoryPageModelToJson(
  _ThemeHistoryPageModel instance,
) => <String, dynamic>{
  'items': instance.items,
  'nextCursor': instance.nextCursor,
};
