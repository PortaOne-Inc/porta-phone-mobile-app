import 'package:freezed_annotation/freezed_annotation.dart';

part 'constraints_dto.freezed.dart';

part 'constraints_dto.g.dart';

@freezed
sealed class PlatformConstraintsDto with _$PlatformConstraintsDto {
  const factory PlatformConstraintsDto({
    double? sizeDp,
    double? safeZoneDp,
    double? toleranceDp,
  }) = _PlatformConstraintsDto;

  factory PlatformConstraintsDto.fromJson(Map<String, dynamic> json) =>
      _$PlatformConstraintsDtoFromJson(json);
}

@freezed
sealed class ConstraintsDto with _$ConstraintsDto {
  const factory ConstraintsDto({
    PlatformConstraintsDto? androidLegacy,
    PlatformConstraintsDto? androidAdaptive,
    PlatformConstraintsDto? ios,
    PlatformConstraintsDto? web,
  }) = _ConstraintsDto;

  factory ConstraintsDto.fromJson(Map<String, dynamic> json) =>
      _$ConstraintsDtoFromJson(json);
}
