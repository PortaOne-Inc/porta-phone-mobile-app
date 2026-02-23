import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'translation_http_model.g.dart';

part 'translation_http_model.freezed.dart';

@freezed
sealed class TranslationHttpModel with _$TranslationHttpModel {
  const factory TranslationHttpModel({
    required String locale,
    required String key,
    required String value,
  }) = _TranslationHttpModel;

  const TranslationHttpModel._();

  factory TranslationHttpModel.fromJson(Map<String, Object?> json) =>
      _$TranslationHttpModelFromJson(json);

  factory TranslationHttpModel.fromJsonString(String stringJson) =>
      _$TranslationHttpModelFromJson(
        jsonDecode(stringJson) as Map<String, Object?>,
      );
}
