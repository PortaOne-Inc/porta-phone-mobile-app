// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthResponseDTO _$AuthResponseDTOFromJson(Map<String, dynamic> json) =>
    _AuthResponseDTO(
      status: json['status'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$AuthResponseDTOToJson(_AuthResponseDTO instance) =>
    <String, dynamic>{'status': instance.status, 'token': instance.token};
