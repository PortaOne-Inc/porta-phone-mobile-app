// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication_resource_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicationResourceDtoImpl _$$PublicationResourceDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicationResourceDtoImpl(
      id: json['id'] as String,
      applicationId: json['applicationId'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      title: json['title'] as String?,
      url: json['url'] as String?,
      note: json['note'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$PublicationResourceDtoImplToJson(
        _$PublicationResourceDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'applicationId': instance.applicationId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'title': instance.title,
      'url': instance.url,
      'note': instance.note,
      'text': instance.text,
    };
