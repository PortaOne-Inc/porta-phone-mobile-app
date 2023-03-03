// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ColorDTO _$$_ColorDTOFromJson(Map<String, dynamic> json) => _$_ColorDTO(
      primary: json['primary'] as int?,
      onPrimary: json['onPrimary'] as int?,
      secondary: json['secondary'] as int?,
      secondaryContainer: json['secondaryContainer'] as int?,
      onSecondaryContainer: json['onSecondaryContainer'] as int?,
      tertiary: json['tertiary'] as int?,
      error: json['error'] as int?,
      outline: json['outline'] as int?,
      background: json['background'] as int?,
      onBackground: json['onBackground'] as int?,
      surface: json['surface'] as int?,
      onSurface: json['onSurface'] as int?,
      gradientTabColor: (json['gradientTabColor'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$_ColorDTOToJson(_$_ColorDTO instance) =>
    <String, dynamic>{
      'primary': instance.primary,
      'onPrimary': instance.onPrimary,
      'secondary': instance.secondary,
      'secondaryContainer': instance.secondaryContainer,
      'onSecondaryContainer': instance.onSecondaryContainer,
      'tertiary': instance.tertiary,
      'error': instance.error,
      'outline': instance.outline,
      'background': instance.background,
      'onBackground': instance.onBackground,
      'surface': instance.surface,
      'onSurface': instance.onSurface,
      'gradientTabColor': instance.gradientTabColor,
    };
