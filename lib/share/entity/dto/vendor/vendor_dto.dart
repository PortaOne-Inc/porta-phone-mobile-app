import 'package:freezed_annotation/freezed_annotation.dart';

part 'vendor_dto.freezed.dart';
part 'vendor_dto.g.dart';

@freezed
class VendorDTO with _$VendorDTO {
  const factory VendorDTO({
    String? theme,
    String? title,
    String? description,
    String? uuid,
    String? id,
  }) = _ApplicationDTO;

  factory VendorDTO.fromJson(Map<String, dynamic> json) => _$VendorDTOFromJson(json);
}
