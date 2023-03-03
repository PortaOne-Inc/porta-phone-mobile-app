// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_style_collection_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TextStyleCollectionDTO _$$_TextStyleCollectionDTOFromJson(
        Map<String, dynamic> json) =>
    _$_TextStyleCollectionDTO(
      generalFontName: json['generalFontName'] as String?,
      displayLarge: json['displayLarge'] == null
          ? null
          : TextStyleDTO.fromJson(json['displayLarge'] as Map<String, dynamic>),
      displayMedium: json['displayMedium'] == null
          ? null
          : TextStyleDTO.fromJson(
              json['displayMedium'] as Map<String, dynamic>),
      displaySmall: json['displaySmall'] == null
          ? null
          : TextStyleDTO.fromJson(json['displaySmall'] as Map<String, dynamic>),
      headlineLarge: json['headlineLarge'] == null
          ? null
          : TextStyleDTO.fromJson(
              json['headlineLarge'] as Map<String, dynamic>),
      headlineMedium: json['headlineMedium'] == null
          ? null
          : TextStyleDTO.fromJson(
              json['headlineMedium'] as Map<String, dynamic>),
      headlineSmall: json['headlineSmall'] == null
          ? null
          : TextStyleDTO.fromJson(
              json['headlineSmall'] as Map<String, dynamic>),
      titleLarge: json['titleLarge'] == null
          ? null
          : TextStyleDTO.fromJson(json['titleLarge'] as Map<String, dynamic>),
      titleMedium: json['titleMedium'] == null
          ? null
          : TextStyleDTO.fromJson(json['titleMedium'] as Map<String, dynamic>),
      titleSmall: json['titleSmall'] == null
          ? null
          : TextStyleDTO.fromJson(json['titleSmall'] as Map<String, dynamic>),
      bodyLarge: json['bodyLarge'] == null
          ? null
          : TextStyleDTO.fromJson(json['bodyLarge'] as Map<String, dynamic>),
      bodyMedium: json['bodyMedium'] == null
          ? null
          : TextStyleDTO.fromJson(json['bodyMedium'] as Map<String, dynamic>),
      bodySmall: json['bodySmall'] == null
          ? null
          : TextStyleDTO.fromJson(json['bodySmall'] as Map<String, dynamic>),
      labelLarge: json['labelLarge'] == null
          ? null
          : TextStyleDTO.fromJson(json['labelLarge'] as Map<String, dynamic>),
      labelMedium: json['labelMedium'] == null
          ? null
          : TextStyleDTO.fromJson(json['labelMedium'] as Map<String, dynamic>),
      labelSmall: json['labelSmall'] == null
          ? null
          : TextStyleDTO.fromJson(json['labelSmall'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_TextStyleCollectionDTOToJson(
        _$_TextStyleCollectionDTO instance) =>
    <String, dynamic>{
      'generalFontName': instance.generalFontName,
      'displayLarge': instance.displayLarge,
      'displayMedium': instance.displayMedium,
      'displaySmall': instance.displaySmall,
      'headlineLarge': instance.headlineLarge,
      'headlineMedium': instance.headlineMedium,
      'headlineSmall': instance.headlineSmall,
      'titleLarge': instance.titleLarge,
      'titleMedium': instance.titleMedium,
      'titleSmall': instance.titleSmall,
      'bodyLarge': instance.bodyLarge,
      'bodyMedium': instance.bodyMedium,
      'bodySmall': instance.bodySmall,
      'labelLarge': instance.labelLarge,
      'labelMedium': instance.labelMedium,
      'labelSmall': instance.labelSmall,
    };
