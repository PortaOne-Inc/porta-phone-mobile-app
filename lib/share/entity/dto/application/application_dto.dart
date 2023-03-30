import 'package:freezed_annotation/freezed_annotation.dart';

import '../theme/theme_dto.dart';

part 'application_dto.freezed.dart';

part 'application_dto.g.dart';

@freezed
class ApplicationDTO with _$ApplicationDTO {
  const factory ApplicationDTO({
    ThemeDTO? theme,
    String? name,
    String? platformIdentifier,
    String? id,
  }) = _ApplicationDTO;

  factory ApplicationDTO.fromJson(Map<String, dynamic> json) => _$ApplicationDTOFromJson(json);
}
