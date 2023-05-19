import 'package:freezed_annotation/freezed_annotation.dart';

part 'texts_model.freezed.dart';

@freezed
class TextsModel with _$TextsModel {
  const factory TextsModel({
    String? greeting,
    String? contactEmail,
  }) = _TextsModel;
}
