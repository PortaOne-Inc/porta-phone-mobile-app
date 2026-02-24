import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_access_model.freezed.dart';

part 'feature_access_model.g.dart';

@freezed
sealed class FeatureAccessModel with _$FeatureAccessModel {
  const factory FeatureAccessModel({
    required String applicationId,
    required Map<String, dynamic> config,
    String? themeId,
    @Default('draft') String status,
    String? createdAt,
    String? updatedAt,
  }) = _FeatureAccessModel;

  factory FeatureAccessModel.fromJson(Map<String, dynamic> json) =>
      _$FeatureAccessModelFromJson(json);
}
