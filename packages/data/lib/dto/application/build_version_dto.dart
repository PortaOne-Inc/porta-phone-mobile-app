import 'package:freezed_annotation/freezed_annotation.dart';

part 'build_version_dto.freezed.dart';

part 'build_version_dto.g.dart';

@freezed
sealed class BuildVersionDTO with _$BuildVersionDTO {
  const factory BuildVersionDTO({String? buildName, int? buildNumber}) =
      _BuildVersionDTO;

  factory BuildVersionDTO.fromJson(Map<String, Object?> json) =>
      _$BuildVersionDTOFromJson(json);
}
