// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseDTOImpl _$$AuthResponseDTOImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseDTOImpl(
      status: json['status'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$$AuthResponseDTOImplToJson(
        _$AuthResponseDTOImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'token': instance.token,
    };
