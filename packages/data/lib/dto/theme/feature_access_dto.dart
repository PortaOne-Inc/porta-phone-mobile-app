import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_access_dto.freezed.dart';

part 'feature_access_dto.g.dart';

@freezed
sealed class FeatureAccessDto with _$FeatureAccessDto {
  const factory FeatureAccessDto({
    required String applicationId,
    required String status,
    required Map<String, dynamic> config,
    String? themeId,
    String? createdAt,
    String? updatedAt,
  }) = _FeatureAccessDto;

  factory FeatureAccessDto.fromJson(Map<String, dynamic> json) =>
      _$FeatureAccessDtoFromJson(json);
}
