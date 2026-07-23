import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_response_dto.freezed.dart';

part 'auth_response_dto.g.dart';

@unfreezed
sealed class AuthResponseDTO with _$AuthResponseDTO {
  factory AuthResponseDTO({required String status, required String token}) =
      _AuthResponseDTO;

  factory AuthResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseDTOFromJson(json);
}
