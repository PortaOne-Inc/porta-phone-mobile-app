import 'package:freezed_annotation/freezed_annotation.dart';

part 'constraints_model.freezed.dart';

part 'constraints_model.g.dart';

@freezed
sealed class ConstraintsModel with _$ConstraintsModel {
  const factory ConstraintsModel({
    PlatformConstraintsModel? androidLegacy,
    PlatformConstraintsModel? androidAdaptive,
    PlatformConstraintsModel? ios,
    PlatformConstraintsModel? web,
  }) = _ConstraintsModel;

  factory ConstraintsModel.fromJson(Map<String, dynamic> json) =>
      _$ConstraintsModelFromJson(json);
}

@freezed
sealed class PlatformConstraintsModel with _$PlatformConstraintsModel {
  const factory PlatformConstraintsModel({
    double? sizeDp,
    double? safeZoneDp,
    double? toleranceDp,
  }) = _PlatformConstraintsModel;

  factory PlatformConstraintsModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformConstraintsModelFromJson(json);
}
