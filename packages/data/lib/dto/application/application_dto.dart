import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'build_version_dto.dart';

part 'application_dto.freezed.dart';

part 'application_dto.g.dart';

@freezed
sealed class ApplicationDTO with _$ApplicationDTO {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ApplicationDTO({
    String? id,
    String? name,
    Map<String, dynamic>? environment,
    String? iosPlatformId,
    String? androidPlatformId,
    String? termsConditionsUrl,
    BuildVersionDTO? appVersion,
    BuildVersionDTO? androidVersion,
    BuildVersionDTO? iosVersion,
    String? coreUrl,
    ContactInfo? contactInfo,
    String? theme,
    @Default(false) bool demo,
  }) = _ApplicationDTO;

  factory ApplicationDTO.fromJson(Map<String, dynamic> json) =>
      _$ApplicationDTOFromJson(json);

  factory ApplicationDTO.fromJsonString(String stringJson) {
    return ApplicationDTO.fromJson(
      jsonDecode(stringJson) as Map<String, dynamic>,
    );
  }
}

@freezed
sealed class ContactInfo with _$ContactInfo {
  // ignore: invalid_annotation_target
  @JsonSerializable(includeIfNull: false)
  const factory ContactInfo({String? appSalesEmail}) = _ContactInfo;

  factory ContactInfo.fromJson(Map<String, dynamic> json) =>
      _$ContactInfoFromJson(json);
}

extension ApplicationDTOConversionExtension on ApplicationDTO {
  String toApplicationDTOJsonString() {
    final jsonEncoder = const JsonEncoder.withIndent('  ').convert(toJson());
    return (StringBuffer()..writeln(jsonEncoder)).toString();
  }
}
