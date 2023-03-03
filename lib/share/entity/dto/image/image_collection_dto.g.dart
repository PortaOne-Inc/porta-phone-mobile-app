// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_collection_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ImageCollectionDTO _$$_ImageCollectionDTOFromJson(
        Map<String, dynamic> json) =>
    _$_ImageCollectionDTO(
      onboarding: json['onboarding'] == null
          ? null
          : ImageDTO.fromJson(json['onboarding'] as Map<String, dynamic>),
      logo: json['logo'] == null
          ? null
          : ImageDTO.fromJson(json['logo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ImageCollectionDTOToJson(
        _$_ImageCollectionDTO instance) =>
    <String, dynamic>{
      'onboarding': instance.onboarding,
      'logo': instance.logo,
    };
