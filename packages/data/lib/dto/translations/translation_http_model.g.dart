// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation_http_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TranslationHttpModel _$TranslationHttpModelFromJson(
  Map<String, dynamic> json,
) => _TranslationHttpModel(
  locale: json['locale'] as String,
  key: json['key'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$TranslationHttpModelToJson(
  _TranslationHttpModel instance,
) => <String, dynamic>{
  'locale': instance.locale,
  'key': instance.key,
  'value': instance.value,
};
