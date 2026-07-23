// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_history_page_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ThemeHistoryPageDto _$ThemeHistoryPageDtoFromJson(Map<String, dynamic> json) =>
    _ThemeHistoryPageDto(
      items: (json['items'] as List<dynamic>)
          .map((e) => ThemeHistoryEntryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['nextCursor'] as String?,
    );

Map<String, dynamic> _$ThemeHistoryPageDtoToJson(
  _ThemeHistoryPageDto instance,
) => <String, dynamic>{
  'items': instance.items,
  'nextCursor': instance.nextCursor,
};
